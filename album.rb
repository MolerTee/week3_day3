require ('pg')
require_relative ('db/sql_runner')

class Album
  attr_reader :id 
  attr_accessor :name , :genre

  def initialize(options)
    @id = options['id'] unless options['id'].nil?
    @name = options["name"]
    @genre = options["genre"]
    @artist_id = options['artist_id'].to_i
  end

  def save()
    sql =
    "
    INSERT INTO albums
    (name , genre , artist_id)
    VALUES
    ('#{@name}' , '#{@genre}' , #{@artist_id})  RETURNING *;
    "
    @id = SqlRunner.run(sql) [0]['id'].to_i
  end

  def self.all()
     sql = "SELECT * FROM albums;"
     albums = SqlRunner.run( sql )
     return albums.map {
      |album| Album.new( album ) 
    }
  end

  
  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id};"
    result = SqlRunner.run( sql ).first
    return Artist.new( result )  

  end


end
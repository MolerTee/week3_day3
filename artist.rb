require ('pg')
require_relative ('db/sql_runner')

class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'] unless options['id'].nil?
    @name = options['name']
  end

  def save()
   sql =
    "
    INSERT INTO artists
    (name)
    VALUES
    ('#{@name}')  RETURNING *;
    "
    @id = SqlRunner.run(sql) [0]['id'].to_i
  end

  def self.all()
     sql = "SELECT * FROM artists;"
     artists = SqlRunner.run( sql )
     return artists.map { |artist| Artist.new( artist ) }
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{ @id };"
    result = SqlRunner.run( sql )
    
    return result.map { |album| Album.new(album) }
  end


end
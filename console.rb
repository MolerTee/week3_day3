require ('pry')
require_relative ('artist')
require_relative ('album')

artist1 = Artist.new({
  "name" => "Led Zeppelin"
  })

  artist1.save()

album1 = Album.new({
  "name" => "How the west was won",
  "genre" => "rock",
  "artist_id" => artist1.id
  })

album1.save()


binding.pry
nil
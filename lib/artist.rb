class Artist
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_song(name, genre)
    Song.new(name, self, genre)
  end

  def songs
    Song.all.select do |song|
      song.artist == self
    end
  end

  def genres
#    Genre.all.select do |genre|
#      genre.artist == self
#    end
    songs.map do |song|
      song.genre
    end
  end

end #end of Artist class

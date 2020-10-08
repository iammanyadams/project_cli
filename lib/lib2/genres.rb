class Artist

attr_accessor :name
attr_reader :songs


@@all = []

  def initialize(:name)
   @name = name
   @songs = []
  end


  def self.all
   @@all
  end

  def save
    self.class.all << self
  end

  def destroy_all
    all.clar
  end

  def self.create(name)
    artist = new(name)
    artist.save
    artist
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  def genres
    songs.collect{ |s| s.genre }.uniq
  end






end

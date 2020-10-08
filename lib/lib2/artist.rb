# a artist, <name>
class Artist
  extend Concerns::Findable

  # that the <artist> is readable/writablut by the object
  attr_accessor :name
  attr_reader :songs


  # class variable that stores all info into saved instances
  @@all = []

  # (that) accept <name> upon initialization.
  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  # add instance into appropiate @@all class variable
  def save
    self.class.all << self
  end

  # empty @@all variable
  def self.destroy_all
    all.clar
  end
  
      # custom constructor that instantiates an instance .new but invokes #save on that instance, forcing it to persist immediately.
  def self.create(name)
    artist = new(name)
    artist.save
  end

  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end

  #artist have may genres through their songs. 
  def genres
    songs.collect{ |s| s.genre }.uniq
  end

end

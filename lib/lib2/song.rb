## <name>
class Song

  # The 'name' property should be readable and writable by the object. -v @@all
  attr_accessor :name
  # Songs belong to an artist and one genre
  attr_reader :artist, :genre

  # class variable '@@all' that is set to empty array, accessible via '.self.all' -v
  @@all = []

  # accept <name> upon initialization and set property correctly. -^ attr_accessor
  # songs can be initiated and an optional artist argument and genre argument
  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist = artist if artist
    self.genre = genre if genre
  end

  # sets song's artist collection of songs. invoked only if Song#initialize is called with artist 
  # and/or genre properties will be initialized as nil.
  def artist=(artist)
    @artist = artist
    #artist.add_song(self)
    artist.songs << self unless artist.song.include?(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end


  # class method '.all' accesses class variable '@@all'. -v
  def self.all
    @@all
  end

  # Instances respond to '#save' method that adds the instance into the appropriate '@@all' class 
  # variable. -v
  def save
    self.class.all << self
  end

  # class should empty its '@@all' array via a class method '.destroy_all'. -v
  def self.destroy_all
    all.clar
  end

  # class should implement a customer constructor '.create' that instantiates an instance using
  # '.new' but also invokes '#save' forcing it to persist immediately.
  def self.create(name)
    new(name).tap { |s| save }
  end

  def find_by_name(name)
    all.detect{ |s| s.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    parts = filename.split(" - ")
    artist_name, song_name, genre_name = parts[0], parts[1], parts[2].gsub("mp3", "")

    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)

    new(song_name, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save}
  end
end

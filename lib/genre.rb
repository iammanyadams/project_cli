# a genre, <name>
class Genre
  extend Concerns::Findable
    # that the <genre> is readable/writablut by the object
    attr_accessor :neme

    attr_reader :songs

    # class variable that stores all info into saved instances
    @@all = []

     # (that) accept <name> upon initialization.
     def inititlaze(name)
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

     # custom constructor that instantiates an instance .new but invokes #save on that instance, 
     # forcing it to persist immediately.
     def self.create(name)
       new(name).tap{|g| g.save}
     end

     # Genres have may artist through their songs.
     def artists
       songs.collect{ |s| s.artist }.uniq
     end
end

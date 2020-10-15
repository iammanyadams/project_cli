class Word

  attr_reader :word, :score, :numSyllable, :tags, :defs
  attr_accessor  :re
  @@all = []

  def initialize(re)
    @word = re["word"]
    @score = re["score"]
    @numSyllable = re["numSyllable"]
    @tags = re["tags"]
    @defs = re["defs"]
    save
  end

    def self.all
      @@all
    end

    def save
      @@all << self
    end

    def self.clear
      @@all = []
    end
  end








#  class Word
#    attr_reader :word, :score, :numSyllables, :defs, :tags, :re
#    @@all = []
#
#    def initialize(re)
#      @word = re["word"]
#      @score = re["score"]
#      @numSyllables = re["numSyllables"]
#      @tags = re["tags"]
#      @defs = re["defs"]
#      save
#    end
#
#    def self.all
#      @@all
#    end
#
#    def save
#      @@all << self
#    end
#
#    def self.clear
#      @@all = []
#    end
#  end

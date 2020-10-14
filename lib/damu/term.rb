  class Term
    include Damu
    attr_accessor :word, :score, :numSyllables, :tags, :defs
    @@all = []

     def self.new_from_words(term_info)
       self.new(
         term_info["word"],
         term_info["score"],
         term_info["numSyllables"],
         term_info["tags"],
         term_info["defs"]
         )
     end

    def initialize(words=nil, score=nil, numSyllables=nil, tags=nil, defs=nil)
      @word = word
      @score = score
      @numSyllable = numSyllable
      @tags = tags
      @defs = defs
      @@all << self
    end

    def self.all
      @@all
    end

    def self.clear
      @@all = []
    end

    def defs
      @defs
    end

    def numSyllables
      @numSyllables
    end

    def score
      @score
    end

    def tags
      @tags
    end

    def word
      @word
    end

  end



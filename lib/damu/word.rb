require 'ostruct'

class Word < OpenStruct

attr_accessor :word, :score, :numSyllables, :tags, :defs
@@all = []

  def initialize(word:nil, score:nil, numSyllables:nil, tags:nil, defs:nil)
    @word, @score, @numSyllables, @tags, @defs = word, score, numSyllables, tags, defs
    @@all << self
  end

  def self.new_from_words(response)
      self.new(
        response[:word],
        response[:score],
        response[:numSyllables],
        response[:tags],
        response[:defs]
      )
  end

  def self.all
    @@all
  end
end

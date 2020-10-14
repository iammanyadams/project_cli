module Damu
class Word
  attr_reader :word, :score, :numSyllables, :defs, :tags
  @@all = []
  def initialize(response_hash)
    @word = response_hash["word"]
    @score = response_hash["score"]
    @numSyllables = response_hash["numSyllables"]
    @tags = response_hash["tags"]
    @defs = response_hash["defs"]
    save
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

end
end

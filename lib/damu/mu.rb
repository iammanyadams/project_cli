require_relative './da.rb'

class Mu
  extend Da
  attr_accessor :word, :tags, :defs, :score, :numSyllable, :info, :all
  @@all = []


#  def self.new_from_words(res)
#    self.new(
#      res["word"],
#      res["tags"],
#      res["defs"],
#      res["score"],
#      res["numSyllable"],
#      res["info"]
#      )
#  end

  def initialize(word=nil, tags=nil, defs=nil, score=nil, numSyllable=nil, info=nil)
    @word = word
    @tags = tags
    @defs = defs
    @score = score
    @numSyllable = numSyllable
    @info = info
    @@all << self
    save
  end


  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def self.clear
    @@all = []
  end

end

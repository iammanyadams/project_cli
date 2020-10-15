class Mu
  attr_accessor :word, :score, :numSyllables, :tags, :defs
  @@all = []

  def initialize(res)
    @word = res["word"]
    @score = res["score"]
    @numSyllables = res["numSyllables"]
    @tags = res["tags"]
    @defs = res["defs"]
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


end

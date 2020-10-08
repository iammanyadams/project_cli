

module Wordnik
  class Word
    extend Wordnik

  attr_accessor :partOfSpeech, :attributionText, :sourceDictionary, :text, :labels
  attr_accessor :citations, :word, :relatedWords, :exampleUses, :textProns, :notes

  @@all = []

  def coin(word_info)
    self.new(
      word_info['partsOfSpeech'],
      word_info['attributionText'],
      word_info['sourceDictionary'],
      word_info['text'],
      word_info['labels'],
      word_info['citations'],
      word_info['word'],
      word_info['relatedWords'],
      word_info['exampleUses'],
      word_info['textProns'],
      word_info['notes']
      )
  end

  def initialize(partOfSpeech:nil, attributionText:nil, sourceDictionary:nil, text:nil, labels:nil,
    citations:nil, word:nil, relatedWords:nil, exampleUses:nil, textProns:nil, notes:nil)

    @partOfSpeech, @attributionText  = partOfSpeech, attributionText
    @sourceDictionary, @text, @labels = sourceDictionary, text, labels
    @citations, @word, @relatedWords = citations, word, relatedWords
    @exampleUses, @textProns, @notes = exampleUses, textProns, notes
    save
  end
#  def initialize(partOfSpeech=nil, attributionText=nil, sourceDictionary=nil, text=nil, labels=nil,
#    citations=nil, word=nil, relatedWords=nil,  exampleUses=nil, textProns=nil, notes=nil)
#
#    @partOfSpeech, @attributionText  = partOfSpeech, attributionText
#    @sourceDictionary, @text, @labels = sourceDictionary, text, labels
#    @citations, @word, @relatedWords = citations, word, relatedWords
#    @exampleUses, @textProns, @notes = exampleUses, textProns, notes
#    save
#  end

  def save
    @@all << self
  end

  def all
    @@all
  end

  end
end

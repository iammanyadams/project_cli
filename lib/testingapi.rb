require 'apicake'
require 'clamp'

module Word
  extend self

  class API < APICake::Base
    base_uri 'https://api.wordnik.com/v4/word.json'
    attr_reader :api_key

    def initialize(api_key=nil, opts={})
      @api_key = api_key
      cache.disable unless opts[:use_cache]
      cache.dir = opts[:cache_dir] if opts[:cache_dir]
      cache.life = opts[:cache_life] if opts[:cache_life]
    end

    def default_query
      { api_key: api_key }
    end
  end




    def self.nik
      @nik = API.new('yltylgfyh23ud95ia3jp9xp92q6uu299bzkqntxwglw5u70s8')
    end







#  class Import
#    include Word
#
#
#
#
#  def functions_menu
#    functions = %w[definitions etymologies examples frequency hyphenation phrases pronunciations  relatedWords scrabbleScore topExample]
#    functions.each_with_index do |f, index|
#    puts "for #{f}, enter '#{f} <words>'."
#    end
#  end
#
#
#  def call
#    input = ""
#    while input != "exit"
#    functions_menu.to_s
#    input = gets.strip
#    end
#    end
#
#
#end
#end
#



  class Operations
    extend Word
    attr_accessor :word_hash, :info
    def self.operations_list
      @word_array =  Word::Operations.nik.cats('definitions')
      @word_array.each do |w|
        Word::Definition.new_from(w)
      end
    end
  end



  class Definition
    include Word
    attr_reader :info, :wordAttributes
    @@all = []

    def self.new_from(w)
      self.new(
        w["partOfSpeech"],
        w["attributionText"],
        w["sourceDictionary"],
        w["text"],
        w["labels"],
        w["citations"],
        w["word"],
        w["relatedWords"],
        w["exampleUses"],
        w["textProns"],
        w["notes"],
        w["attributionUrl"],
        w["wordnikUrl"]
        )
      end

    def initialize(info=nil)
      @info = info
    end

    def self.all
      @@all
    end

    def info
      @info
    end

    def wordAttributes
      @wordAttributes
    end
  end

end


##word = 'tacos'
##nik = API.new('yltylgfyh23ud95ia3jp9xp92q6uu299bzkqntxwglw5u70s8')
##path = 'nik.{word}(definitions)'
##path.sub!('{word}', word.to_s)
#
#


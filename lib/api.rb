require 'apicake'
  

# module Wordnik
#  class API < APICake::Base
#    extend Wordnik
#  base_uri 'https://api.wordnik.com/v5/word.json'
#
#  def initialize(api_key)
#    @api_key = api_key
#    cache.enable
#    cache.dir = './tmp'
#    cache.life = 60
#  end
#
#  def default_request
#    { format: :json, use_canonical: false,  api_key: api_key }
#  end
#
#  @api = Wordnik::API.new #{MYAPI}
#
#
#  end
#end  
#





module Wordnik
 extend self

  class API < APICake::Base
    base_uri 'api.wordnik.com/v5/word.json'
    attr_reader :api_key
    def initialize(api_key)
      @api_key = api_key
      cache.enable
      cache.dir ='./tmp'
      cache.life = 60
    end

    def default_request
      { api_key: api_key }
    end
  end

  def nik
    @nik = Wordnik::API.new 'yltylgfyh23ud95ia3jp9xp92q6uu299bzkqntxwglw5u70s8'
  end

  def word(*arg)
    @word = arg
  end

  def self.definitions(*arg)
    @nik.word('definitions')
  end

  def self.etymologies(*arg)
    @nik.word('etymologies')
  end

  def self.examples(*arg)
    nik.word('examples')
  end

  def self.frequency(*arg)
    nik.word('frequency')
  end

  def self.hyphenations(*arg)
    @nik.word('hyphenations')
  end

  def self.phrases(*arg)
    @nik.word('phrases')
  end

  def self.pronunciations(*arg)
    @nik.word('pronunciations')
  end

  def self.relatedWords(*arg)
    @nik.word('relatedWords')
  end

  def self.scrabbleScore(*arg)
    @nik.word('scrabbleScore')
  end

  def self.topExample(*arg)
    @nik.word('topExample')
  end

end

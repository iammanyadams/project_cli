require 'apicake'


module Da
  extend self

  class API < APICake::Base
    base_uri 'api.datamuse.com'
    attr_accessor :re, :words, :sug
    include Da

    def initialize()
      cache.enable
      cache.dir = './tmp'
      cache.life = 60
    end

    def self.words(query=nil)
      response = get('/words?md=dpsrf&', query: query)
      response.parsed_response.each do |re|
        Word.new(re)
      end
    end

    def self.sug(query=nil)
      response = get('/sug?md=dpsrf&', query: query)
      response.parsed_response.each do |re|
        Word.new(re)
      end
    end
 end
end

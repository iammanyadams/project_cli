require 'httparty'
require 'apicake'

module Damu
  extend self
class API
  inaclude HTTParty
  base_uri 'api.datamuse.com'

    def self.endpoint(**args)
      resp = get('/words', query: args)
      resp.each do |response_hash|
        Word.new(response_hash)
      end
    end

    def self.sug_endpoint(**args)
      resp = get('/sug', query: args)
      resp.parsed_response
    end

end





#require 'httparty'
#
#class Damu::API
#  include HTTParty
#    extend Damu
#    base_uri 'api.datamuse.com'
#    attr_accessor :words, :sug,
#
#    def self.words_endpoint(**args)
#      get('/words', query: args)
#    end
#
#    def self.sug_endpoint(**args)
#      get('/sug', query: args)
#    end
#  end




















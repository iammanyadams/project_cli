#require 'httparty'
require 'apicake'


class Da < APICake::Base
  #include HTTParty
  base_uri 'api.datamuse.com'
  attr_accessor :re

  def self.words(**aargs)
    response = get('/words', query: aargs)
    response.parsed_response.each do |re|
      Mu.new(re)
    end
  end

  def self.suggest(**aargs)
    response = get('/sug', query: aargs)
    response.parsed_response.each do |re|
      Mu.new(re)
    end
  end

end

require 'apicake'
require 'ostruct'
require 'httparty'


module Datamuse
  extend self

  class Request < APICake::Base
    base_uri 'api.datamuse.com'
    attr_accessor :queries, :response, :result, :results

    def self.get(**queries)
      @response = self.get('/words',query:queries)
      Results.new(response.parsed_response, queries)
    end
  end


  class Results
    attr_accessor :response, :query

    def initialize(response)
      @results = response.map{|resp| Word.new(resp)}
    end
  end

  class Word < OpenStruct
  end


  CRITERIA = {
    means_like: :ml, sounds_like: :sl, spelled_like: :sp, related_popular_nouns: :rel_jja,
    related_popular_adjectives: :rel_jjb, related_synonyms: :rel_syn, related_triggers: :rel_trg,
    related_antonyms: :rel_ant, kind_of_hyponyms: :rel_spc, general_hyponyms: :rel_gen,
    comporomise_hyponyms: :rel_com, part_of_meronyms: :rel_par, frequent_followers: :rel_bga,
    frequent_predecessors: :rel_bgb, related_rhymes: :rel_rhy, approximate_rhymes: :rel_nry,
    related_homophones: :rel_hom, consonant_match: :rel_cns
  }


  class Criteria < OpenStruct
  end
  
  CRITERIA.each do |k,v|
    Criteria.new(name:k, call:v).each do
      define_method(k) do
        Request.get(v => self)
      end
    end
  end
end
 













#
#
#  #def Damu.criteria_each
#    CRITERIA.each do |key, value|
#    define_method(key) do |**args|
#      Damu::Request.send(key, self, args)
#    end
#  end

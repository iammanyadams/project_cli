require 'httparty'

module Da
  extend self
    include HTTParty
    base_uri 'api.datamuse.com'
    attr_accessor :criteria

    def self.words(parameters)
      get('/words', query: parameters)
    end

    def self.suggests(parameters)
      get('/sug', query: parameters)
    end

    def find_words(da)
      self.words(da)
    end
    def query_parameters
      @criteria={
        sl:"sounds_like",
        ml:"means_like",
        sp:"spelled_like",
        rel_jja:"related_adj",
        rel_jjb:"related_noun",
        rel_syn:"synonyms",
        rel_trg:"triggers",
        rel_ant:"antonyms",
        rel_spc:"kind_of",
        rel_gen:"more_general",
        rel_com:"comprises",
        rel_par:"part_of",
        rel_bga:"frequent_followers",
        rel_bgb:"frequently_follows",
        rel_rhy:"rhymes",
        rel_nry:"kinda_rhymes",
        rel_hom:"homophones",
        rel_cns:"consonants_match",
        topics:"topics",
        lc:"often_follow",
        rc:"often_before"
        }
     end

end

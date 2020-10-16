require 'httparty'

module Da
  extend self
    include HTTParty
    base_uri 'api.datamuse.com'
    attr_accessor :criteria

    def Da.words(parameters)
      get('/words', query: parameters)
    end

    def Da.suggests(parameters)
      get('/sug', query: parameters)
    end


    def query_parameters
      @criteria={
        :sounds_like=>"sl:",
        :means_like=>"ml:",
        :spelled_like=>"sp:",
        :related_adj=>"rel_jja:",
        :related_noun=>"rel_jjb:",
        :synonyms=>"rel_syn:",
        :triggers=>"rel_trg:",
        :antonyms=>"rel_ant:",
        :kind_of=>"rel_spc:",
        :more_general=>"rel_gen:",
        :comprises=>"rel_com:",
        :part_of=>"rel_par:",
        :frequent_followers=>"rel_bga:",
        :frequently_follows=>"rel_bgb:",
        :rhymes=>"rel_rhy:",
        :kinda_rhymes=>"rel_nry:",
        :homophones=>"rel_hom:",
        :consonants_match=>"rel_cns:",
        :topics=>"topics:",
        :often_follow=>"lc:",
        :often_before=>"rc:"
        }
     end

end

require 'httparty'

module Damu
  extend self
    include HTTParty
    base_uri 'api.datamuse.com'


    def self.words(parameters)
      get('/words', query: parameters)
    end

    def self.sug(parameters)
      get('/sug', query: parameters)
    end


  def constraints
    @constraints={
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

     Damu.find(constraint, word)
     @parameters = @constraints[constraint.to_sym]
     @parameters << " '#{word]'"
     term_array = Damu.words(parameters)
       term_array.each do |term_info|
         Term.new_from_words(term_info)
       end
     end

end

##
##    def sounds_like(*args)
##      Damu.words(sl: args, md: 'dpsrf').each do |w|
##      Damu::Term.new_from_words(w)
##    end
##
##
##end
#
##        def sounds_like(args).each do |w|
##          Damu::Term.new_from_words(w)
##        end
##    end
##
##    def means_like(args)
##      Damu.words(ml: "#{args}", md: 'dpsrf')
##    end
##
##    def spelled_like(args)
##      Damu.words(sp: "#{args}", md: 'dpsrf')
##    end
##
##    def described_adj(args)
##      Damu.words(rel_jja: "#{args}", md: 'dpsrf')
##    end
##
##    def describing_noun(args)
##      Damu.words(rel_jjb: "#{args}", md: 'dpsrf')
##    end
##
##    def synonyms(args)
##      Damu.words(rel_syn: "#{args}", md: 'dpsrf')
##    end
##
##    def triggers(args)
##      Damu.words(rel_trg: "#{args}", md: 'dpsrf')
##    end
##
##    def antonyms(args)
##      Damu.words(rel_ant: "#{args}", md: 'dpsrf')
##    end
##
##    def kind_of(args)
##      Damu.words(rel_spc: "#{args}", md: 'dpsrf')
##    end
##
##    def more_general(args)
##      Damu.words(rel_gen: "#{args}", md: 'dpsrf')
##    end
##
##    def comprises(args)
##      Damu.words(rel_com: "#{args}", md: 'dpsrf')
##    end
##
##    def part_of(args)
##      Damu.words(rel_par: "#{args}", md: 'dpsrf')
##    end
##
##    def frequent_followers(args)
##      Damu.words(rel_bga: "#{args}", md: 'dpsrf')
##    end
##
##    def frequently_follows(args)
##      Damu.words(rel_bgb: "#{args}", md: 'dpsrf')
##    end
##
##    def rhymes(args)
##      Damu.words(rel_rhy: "#{args}", md: 'dpsrf')
##    end
##
##    def kinda_rhymes(args)
##      Damu.words(rel_nry: "#{args}", md: 'dpsrf')
##    end
##
##    def homophones(args)
##      Damu.words(rel_hom: "#{args}", md: 'dpsrf')
##    end
##
##    def consonants_match(args)
##      Damu.words(rel_cns: "#{args}", md: 'dpsrf')
##    end
##
##    def topics(args)
##      Damu.words(topics: "#{args}", md: 'dpsrf')
##    end
##
##    def often_follow(args)
##      Damu.words(lc: "#{args}", md: 'dpsrf')
##    end
##
##    def often_before(args)
##      Damu.words(rc: "#{args}", md: 'dpsrf')
##    end
#
#
#
#
#end

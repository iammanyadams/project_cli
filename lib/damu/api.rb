require 'apicake'
require 'ostruct'
module Damu
  extend self

  WORD_METHODS = {
    means_like: :ml, sounds_like: :sl, spelled_like: :sp, related_popular_nouns: :rel_jja,
    related_popular_adjectives: :rel_jjb, related_synonyms: :rel_syn, related_triggers: :rel_trg,
    related_antonyms: :rel_ant, kind_of_hyponyms: :rel_spc, general_hyponyms: :rel_gen,
    comporomise_hyponyms: :rel_com, part_of_meronyms: :rel_par, frequent_followers: :rel_bga,
    frequent_predecessors: :rel_bgb, related_rhymes: :rel_rhy, approximate_rhymes: :rel_nry,
    related_homophones: :rel_hom, consonant_match: :rel_cns
  }


  def Request.words(query)
    response = get('/words',query=queries)
    Result.new(response.parsed_response,queries)
  end

  
  def method_missing(*args,name)
    if args.any? && WORD_METHODS[name]
    query.merge! args.first => WORD_METHODS[name]
    Request.words(@query)
  end
end


end

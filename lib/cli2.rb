# frozen_string_literal: true
require 'tty-prompt'

module Da
  class CLI

#def question
  prompt = TTY::Prompt.new

  query_parameters = [
    "means_like (ml)",
    "sound like (sl)",
    "are spelled like (sp)",
    "are commonly modified by adjective (rel_jja)",
    "normally modify the noun (rel_jjb)",
    "are synonymous with (rel_syn)",
    "are triggers of (rel_trg)",
    "are antonyms of (rel_ant)",
    "are a kind_of (rel_spc)",
    "are more general than (rel_gen)",
    "comprises (rel_com)",
    "are a part of (rel_par)",
    "frequently follow (rel_bga)",
    "frequently preceed (rel_bgb)",
    "rhyme with (rel_rhy)",
    "approximately rhymes with (rel_nry)",
    "are homophones with (rel_hom)",
    "consonants match (rel_cns)"
    ]


  answer = prompt.select("I can show you words that ", query_parameters, per_page: 10, cycle: false)

  puts answer.inspect
 
  lookup = prompt.ask("Which word?")

#end

def menu
  puts 
end


def start

end

end
 end

module Da
#  extend self

     CRITERIA = {
   :mean_like=>"ml", :sound_like=>"sl", :spelled_like=>"sp",
   :often_described_by=>"rel_jja", :often_describing=>"rel_jjb",
   :rel_synonym=>"rel_syn", :rel_trigger=>"rel_trg", :rel_antonym=>"rel_ant",
   :rel_kind_of=>"rel_spc", :rel_more_general_than=>"rel_gen",
   :rel_comprise=>"rel_com", :part_of=>"rel_par",
   :frequently_follow=>"rel_bga", :frequently_preceed=>"rel_bgb",
   :rhyme_with=>"rel_rhy", :kinda_rhyme_with=>"rel_nry",
   :sound_alike=>"rel_hom", :consonant_matching=>"rel_cns",
   :topics=>"topics", :left_context=>"lc", :right_context=>"rc", :max=>"max", :metadata=>"md"
   }

end

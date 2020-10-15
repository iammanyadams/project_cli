require 'clamp'
require 'highline/import'
  class CLI
    extend Da

        def start
      Clamp do
#      parameter "DAMU", 'the damu'
      Da::CRITERIA.each_pair do |k,v|
        subcommand "#{k}", "#{v}" do
          def execute
            puts word
          end
        end
       end


        def call
          say("Welcome. To find a word(s)...choose a criteria")
          @crit_keys = Da::CRITERIA.keys
#          say("

            end


#    def menu
#        @crit_keys = Da::CRITERIA.keys
#        say("[words to find][criteria: sound_like, spelled_like...][variable: a word]")
#        @crit = ask("the criteria is:  ", @crit_keys) { |q| q.readline = true; q.echo = true }
#        @arg = ask("#{@crit} the variable: ")
#        say("developing list of words that(are) #{@crit} #{@arg}...")
#        show_list
#     end
#     def show_list
#         Da::API.words(sl: 'pigs')
#
#        end

end
end
end

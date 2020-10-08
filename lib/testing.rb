require 'optparse'
require 'ostruct'


class Da
  Version = '0.1.0'

 CONSTRAINTS = %w[ml sl sp rel_jja rel_jjb rel_syn rel_trg rel_ant rel_spc rel_gen rel_com rel_par rel_bga rel_bgb rel_rhy rel_nry rel_hom rel_cns v topics lc rc max]


    class Mu
      attr_accessor :word, :score, :numSyllable
      def initialize
      end


      def create_menu(parser)
        full_options(parser)
        com_noptions(parser)
      end

      def com_noptions(parser)
        parser_on_tail('-v', 'show version') do
          puts parser; exit
      end
      def full_options(parser)
      end
    end


  def parse(args)
    @options = Options.new
    @args = OptionParser.new do |parser|
      @options.define_options(parser)
      parser.parse!(args)
    end



















params = {}
OptionParser.new do |opts|
  opts.on('-a')
  opts.on('-b NUM', String)
  opts.on('-v', '--verbose')
parser.on('-d')

end.parse!(into: params)
p params






#require 'optparse'
#
#User = Struct.new(:id, :name)
#
#def find_user id
#  not_found = ->{ raise "No User Found for id #{id}" }
#  [ User.new(1, "Sam"),
#    User.new(2, "Gandalf") ].find(not_found) do |u|
#    u.id == id
#  end
#end
#
#op = OptionParser.new
#op.accept(User) do |user_id|
#  find_user user_id.to_i
#end
#
#op.on("--user ID", User) do |user|
#  puts user
#end
#
#op.parse!
#












#require 'optparse'
#
#
#
#WERD = Struct.new(:word, :score, :numSyllable)
#CONSTRAINT = %w[a b c d e f g h i j k l m n] 
#
##{"a" => "adam", "b" => "bob", "c" => "cat"}
#
#
##def coin_werds
##  not_found = ->{ raise "No werd found called #{werd_id}" }
##  [ Werd.new(1, "Sam"),
##    Werd.new(2, "Gandalf") ].find(not_found) do |u|
##    werd_id == id
##  end
##end
#
#def coin_werds(werd, score, numSyllables)
#  Werd = Struct.new(:werd, :score, :numSyllables)
#end
#
#
#
#op = OptionParser.new
#op.accept(Werd) do |werd_id|
#  coin_werd werd_id.to_i
#end
#
#op.on("--constraint WERD", CONSTRAINT) do |c|
#  puts "#{c}: #{werd}"
#end
#
#op.parse!
#

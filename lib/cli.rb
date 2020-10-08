require 'optparse'
require 'optparse/time'
require 'ostruct'
require 'pp'

class Words
  Version = '1.0.0'

  CODES = %w[ml sl sp rel_jja rel_jjb rel_syn rel_trg rel_ant rel_spc rel_gen rel_com rel_par   rel_bga rel_bgb rel_rhy rel_nry rel_hom rel_cns v topics lc rc max]
  CODE_ALIASES = { 'means' => 'ml', 'sounds' => 'sl', 'spelled' => 'sp', 'nouns_modif' => 'rel_jja', 'mod_by_adj' => 'rel_jjb', 'synonym' => 'rel_syn', 'triggers' => 'rel_trg', 'antonym' =>
  'rel_ant', 'kindof' => 'rel_spc', 'general' => 'rel_gen', 'comprises' => 'rel_com', 'part_of' =>  'rel_par', 'follows' => 'rel_bga', 'preceeds' => 'rel_bgb', 'rhymes' => 'rel_rhy', 'kinda_rhymes' => 'rel_nry', 'sounds_alike' => 'rel_hom', 'consonants' => 'rel_cns', 'voc' => 'v', 'top' => 'topics', 'left' => 'lc', 'right' => 'rc', 'max' => 'max'}

  META_DATA = {'d' => 'definitions', 'p' => 'parts of speech', 's' => 'syllable count', 'r' => 'pronunciation'}


            class Options
              attr_accessor :constraint
              def initialize
                self.constraint = "#{ARGV[0]}"
              end

              def define_options(parser)
                constraint_option(parser)
                metadata_option(parser)
                common_options(parser)

              end


              def common_options(parser)
                parser.separator ""
                parser.on_tail("-h", "--help", "Show this message") do
                  puts parser
                  exit
                end
                parser.on_tail("--version", "Show version") do
                  puts Version
                  exit
                end
              end

              def constraint_option(parser)
              # Keyword completion.  We are specifying a specific set of arguments (CODES
              # and CODE_ALIASES - notice the latter is a Hash), and the user may provide
              # the shortest unambiguous text.
                codes = (CODE_ALIASES.keys + CODE_ALIASES.values).join(' , ')
                parser.on("--code [TERM]", CODES, "find words",
                "(#{codes})") do |search|
                self.search =  word
                end
               end

              def metadata_option(parser)
                meta_data = META_DATA.keys
                parser.on("-md [MD]", META_DATA.keys, "metadata") do |metadata_selection|
                  %Q[md: #{metadata_selection}]
                end
             end
        end
  


    def parse(args)
    # The options specified on the command line will be collected in
    # *options*.

    @options = Options.new
    @args = OptionParser.new do |parser|
      @options.define_options(parser)
      parser.parse!(args)
    end
    @options
    end

  attr_reader :parser, :options
#end  # class OptparseExample





example = Words.new
options = example.parse(ARGV)
pp options # example.options
pp ARGV
pp parsed





end



#
#    def initialize
##      self.library = []
##      self.inplace = false
#      self.encoding = "utf8"
##      self.transfer_type = :auto
##      self.verbose = false
#    end
#
#    def define_options(parser)
#      parser.banner = "Usage: example.rb [options]"
#      parser.separator ""
#      parser.separator "Specific options:"
#
#      # add additional options
##      perform_inplace_option(parser)
##      delay_execution_option(parser)
##      execute_at_time_option(parser)
##      specify_record_separator_option(parser)
##      list_example_option(parser)
#      specify_encoding_option(parser)
##      optional_option_argument_with_keyword_completion_option(parser)
##      boolean_verbose_option(parser)
#
#      parser.separator ""
#      parser.separator "Common options:"
#      # No argument, shows at tail.  This will print an options summary.
#      # Try it and see!
#      parser.on_tail("-h", "--help", "Show this message") do
#        puts parser
#        exit
#      end
#      # Another typical switch to print the version.
#      parser.on_tail("--version", "Show version") do
#        puts Version
#        exit
#      end
#    end
#
#
##
##    def perform_inplace_option(parser)
##      # Specifies an optional option argument
##      parser.on("-i", "--inplace [EXTENSION]",
##                "Edit ARGV files in place",
##                "(make backup if EXTENSION supplied)") do |ext|
##        self.inplace = true
##        self.extension = ext || ''
##        self.extension.sub!(/\A\.?(?=.)/, ".")  # Ensure extension begins with dot.
##      end
##    end
##
##    def delay_execution_option(parser)
##      # Cast 'delay' argument to a Float.
##      parser.on("--delay N", Float, "Delay N seconds before executing") do |n|
##        self.delay = n
##      end
##    end
##
##    def execute_at_time_option(parser)
##      # Cast 'time' argument to a Time object.
##      parser.on("-t", "--time [TIME]", Time, "Begin execution at given time") do |time|
##        self.time = time
##      end
##    end
##
##    def specify_record_separator_option(parser)
##      # Cast to octal integer.
##      parser.on("-F", "--irs [OCTAL]", OptionParser::OctalInteger,
##                "Specify record separator (default \\0)") do |rs|
##        self.record_separator = rs
##      end
##    end
##
##    def list_example_option(parser)
##      # List of arguments.
##      parser.on("--list x,y,z", Array, "Example 'list' of arguments") do |list|
##        self.list = list
##      end
##    end
#
#    def specify_encoding_option(parser)
#      # Keyword completion.  We are specifying a specific set of arguments (CODES
#      # and CODE_ALIASES - notice the latter is a Hash), and the user may provide
#      # the shortest unambiguous text.
#      code_list = (CODE_ALIASES.keys + CODES).join(', ')
#      parser.on("--code CODE", CODES, CODE_ALIASES, "Select encoding",
#                "(#{code_list})") do |encoding|
#        self.encoding = encoding
#      end
#    end
#
##    def optional_option_argument_with_keyword_completion_option(parser)
##      # Optional '--type' option argument with keyword completion.
##      parser.on("--type [TYPE]", [:text, :binary, :auto],
##                "Select transfer type (text, binary, auto)") do |t|
##        self.transfer_type = t
##      end
##    end
##
##    def boolean_verbose_option(parser)
##      # Boolean switch.
##      parser.on("-v", "--[no-]verbose", "Run verbosely") do |v|
##        self.verbose = v
##      end
##    end
#  end
##
##  #
#  # Return a structure describing the options.
#  #
#  def parse(args)
#    # The options specified on the command line will be collected in
#    # *options*.
#
#    @options = ScriptOptions.new
#    @args = OptionParser.new do |parser|
#      @options.define_options(parser)
#      parser.parse!(args)
#    end
#    @options
#  end
#
#  attr_reader :parser, :options
##end  # class OptparseExample
#
#example = OptparseExample.new
#options = example.parse(ARGV)
#pp options # example.options
#pp ARGV
#
#
#
#
#
#
#
##
##
##
##
##
##
##        opts.on('-ml WORD', 'with meanings similair to WORD')
##        opts.on('-sl WORD', 'that sounds like WORD')
##        opts.on('-sp WORD', 'that are spelled like')
##        opts.on('-jja WORD', 'normally described by the adjective')
##        opts.on('-jjb WORD', 'that describe the noun')
##        opts.on('-syn WORD', 'synonymous with')
##        opts.on('-trg WORD', 'triggered by')
##        opts.on('-ant WORD', 'that are antonyms of')
##        opts.on('-spc WORD', 'that are a kind of')
##        opts.on('-gen WORD', 'more general than')
##        opts.on('-com WORD', 'that comprise')
##        opts.on('-par WORD', 'that are part of')
##        opts.on('-bga WORD', 'frequently followed by')
##        opts.on('-bgb WORD', 'frequently preceed by')
##        opts.on('-rhy WORD', 'that rhyme with')
##        opts.on('-nry WORD', 'that kinda rhymes with')
##        opts.on('-hom WORD', 'that is are homophone with')
##        opts.on('-cns WORD', 'whose consonants match')
##
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
##require 'optparse'
##
##module Da
##  extend self
##
##Options = Struct.new
##class Parser
##  def self.parse(options)
##    args = Options.new("word")
##
##
##    opt_parser = OptionParser.new do |opts|
##         opts.on("--ml", "with meanings similair to")
##         opts.on("--sl", "that sounds like")
##         opts.on("--sp", "that are spelled like")
##         opts.on("--jja", "normally described by the adjective")
##         opts.on("--jjb", "that describe the noun")
##         opts.on("--syn", "synonymous with")
##         opts.on("--trg", "triggered by")
##         opts.on("--ant", "that are antonyms of")
##         opts.on("--spc", "that are a kind of")
##         opts.on("--gen", "more general than")
##         opts.on("--com", "that comprise")
##         opts.on("--par", "that are part of")
##         opts.on("--bga", "frequently followed by")
##         opts.on("--bgb", "frequently preceed by")
##         opts.on("--rhy", "that rhyme with")
##         opts.on("--nry", "that kinda rhymes with")
##         opts.on("--hom", "that is are homophone with")
##         opts.on("--cns", "whose consonants match")
##
##         opts.on("-h", "--help", "Prints this help") do
##           puts opts
##           exit
##         end
##       end
##opts_parser.parse!(options)
##return args
##end
##end
##options = Parser.parse %w[--help]
##
##
##
##
##class CLI
##  extend Da
##
##
##end
##end
#end
#
#
#
#
#
#
#
#    attr_accessor :library, :inplace, :transfer_type,
#                  :verbose, :extension, :delay, :time, :record_separator,
#                  :list

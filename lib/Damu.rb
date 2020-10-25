$:.unshift(File.expand_path("../", __FILE__))
require "damu/version"
require "damu/api"




module Damu
  autoload :Help, "damu/help"
  autoload :Command, "damu/command"
  autoload :CLI, "damu/cli"
end

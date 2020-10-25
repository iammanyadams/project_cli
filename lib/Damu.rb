$:.unshift(File.expand_path("../", __FILE__))
require "damu/version"

module Damu
  autoload :Help, "damu/help"
  autoload :Command, "damu/command"
  autoload :CLI, "damu/cli"
end

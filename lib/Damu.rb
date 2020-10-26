$:.unshift(File.expand_path("../", __FILE__))
require "damu/version"
require "damu/api"
require "damu/cli"



module Findable
  def find_by_name(name)
    self.all.detect {|obj| obj.name ==name}
  end
end

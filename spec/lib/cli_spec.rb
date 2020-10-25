require "spec_helper"

# to run specs with what"s remembered from vcr
#   $ rake
#
# to run specs with new fresh data from aws api calls
#   $ rake clean:vcr ; time rake
describe Damu::CLI do
  before(:all) do
    @args = "--from Tung"
  end

  describe "Damu" do
    it "should hello world" do
      out = execute("exe/Damu hello world #{@args}")
      expect(out).to include("from: Tung\nHello world")
    end
  end
end

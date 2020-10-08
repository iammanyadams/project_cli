require 'optparse'

params = {}
OptionParser.new do |opts|
  opts.on('-a')
  opts.on('-b NUM', Integer)
  opts.on('-v', '--verbose')
end.parse!(into: params)

p paramsend

op.parse!

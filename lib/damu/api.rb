require 'apicake'

class Datamuse < APICake::Base

   base_uri 'api.datamuse.com'

  def self.words(**args)
    res = get('/words', query: args)
    Word.new = OpenStruct.new(res.parsed_response)
  end

  def self.sug(**args)
    res = get('/sug', query: args)
    Word.new = OpenStruct.new(res.parsed_response)
  end
end

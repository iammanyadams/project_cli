require 'apicake'

class Datamuse < APICake::Base

   base_uri 'api.datamuse.com'

  def self.words(**args)
    response  = get('/words', query: args)
    response.each_with_index{|r,i| Word.new = OpenStruct.new(r i)}
    end

  def self.sug(**args)
    res = get('/sug', query: args)
    Word.new(resp = res.parsed_response)
  end

end

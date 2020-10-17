require 'highline/import'

class CLI


  def call
    say("welcome")
    criteria = ask("select a criteria", self.list)
    p criteria
    criteria_key = Da.query_parameters.key(criteria)
    selection = ask("which word?")
    parameters = "#{criteria_key}: '#{selection}'"
    Da.words("#{parameters}")
binding.pry

  end

# Da.words "#{criteria_key}: #{selection}"

  def menu
  end


  def list
    q = Da.query_parameters.values.to_a
    a = q.first(7)
    c = q.last(7)
    b = q - a - c
    puts "#{a}".gsub(", \"", " ").gsub("\"", " ")
    puts "#{b}".gsub(", \"", " ").gsub("\"", " ")
    puts "#{c}".gsub(", \"", " ").gsub("\"", " ")
  end


  def bye
  end

end

#    self.find_words(criteria, selection) 
#  end
#
#  def find_words(criteria, selection)
#    criteria_key = Da.query_parameters.key(criteria)
#    da = "#{criteria_key}: '#{selection}'"
#    Da.find_words(da)

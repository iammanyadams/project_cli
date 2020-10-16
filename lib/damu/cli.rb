require 'highline/import'


class CLI
  def call
    say("welcome")
    menu
    bye
  end

  def menu
    criteria = Da::CRITERIA.keys.to_s
    criteria_sel = ask("select a criteria #{criteria}.") do |q|
      q.readline = true
      q.echo = true
     end
    query = ask("which word")
    Da.words("#{criteria_sel}: #{query}")
  end

  def list_criteria
    Da::CRITERIA.all.each.with_index(1) do |word, index|
      puts "#{index}. #{word}"
   end
  end

  def word_details(selection)
   sel =  Mu.all["#{selection}"]
  puts sel.word
  puts sel.defs
  puts sel.tags
    end


  def bye
    say("goodbye")
    exit
  end

end
    

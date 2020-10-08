 class Wordnik
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ""

    while input != "exit"
      puts "welcome!"
puts "to define, enter 'f'."
puts "to relate, enter 'r'."
puts "to list, enter 'l'."
puts "to discuss, enter 'd'."
puts "to see, enter 's'."
puts "to hear, enter 'h'."
puts "to love, enter 'l'."

case input
-- define..
--relate..
--list..
--discuss..
--see..
--hear..
--love..



-w-word_of_the_day-ww-
-w-random_word-ww-

-d-definitions-dd-
-d-etymologies-dd-

-d-synonyms-dd-
-d-hypernyms--
--hyponyms..
--same_context..
--cross_reference..
--tags..
--reverse_dictionary..
--tagging..


--lists..
--visuals..


-d-examples-dd-

-d-note-dd-
-d-stats-dd-
-d-related_words-dd-


      puts "To see word definition, enter 'd'."
      puts "To see word etymology, enter 'e'."
      puts "To see word examples, enter 'x'."
      puts "To see word frequency, enter 'f'."
      puts "To see word hyphenation, enter 'h'."
      puts "To see word pronunciations, enter 'p'."
      puts "To find words by relation to a given word, enter 'r'." 
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip
       case input
      when "d"; 
        list_definition
      when "e"
        list_etymology
      when "x"
        list_examples
      when "f"
        list_word_frequency
      when "h"
        list_hyphenation
      when "p"
        list_pronunciation
      when "r"
        list_relations
        end
      end
    end
  end

  def list_songs
    Song.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
      puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |a, i|
      puts "#{i}. #{a.name}"
    end
  end

  def list_genres
    Genre.all.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |g, i|
      puts "#{i}. #{g.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip

    if artist = Artist.find_by_name(input)
      artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.name} - #{s.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      genre.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |s, i|
        puts "#{i}. #{s.artist.name} - #{s.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"

    input = gets.strip.to_i
    if (1..Song.all.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
    end

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
end

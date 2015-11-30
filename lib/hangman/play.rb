require 'stringio'

# Hangman module
module Hangman
  # This class follows gameplay logic
  class Play
    def show_word(picked_word, enter_guess)
      # picked_word = Hangman::Choice.new.pick_word
      placeholder = ''
      picked_word.chars do |char|
        placeholder += (enter_guess.include? char) ? char : '*'
      end
      placeholder
    end

    def enter_guess
      $stdout.puts 'Please  enter a letter'
      puts "\n"
      string = '3'
      while string.to_i != 0 || string.length != 1
        string = $stdin.gets.chomp.downcase
      end
      string
    end
  end
end

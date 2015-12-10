require 'stringio'

# Hangman module
module Hangman
  # This class follows gameplay logic
  class Play
    def show_word(picked_word, guess)
      display = ''
      picked_word.chars do |char|
        display += (guess.include? char) ? char : '*'
      end
      display
    end

    def enter_guess
      entry = ''
      loop do
        $stdout.puts 'Please  enter a letter'
        entry = $stdin.gets.chomp.downcase
        break if entry.match(/^\D*$/) && entry.length == 1
      end
      entry
    end
  end
end

# Hangman module
module Hangman
  # This class serves words from file and tracks their display
  class Choice
    def initialize
      @dictionary = File.readlines('lib/5desk.rb')
    end

    def pick_word
      loop do
        word_choice = @dictionary.sample.chomp.downcase
        break(word_choice) if word_choice.length >= 5
      end
    end
  end
end

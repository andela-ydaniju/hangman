# Hangman module
module Hangman
  # This class serves words from file and tracks their display
  class Choice
    def initialize
      read_file './lib/hangman/5desk.txt'
    end

    def read_file(dictionary)
      @@word_array ||= File.readlines(dictionary)
    end

    def pick_word
      loop do
        choice = @@word_array.sample.chomp.downcase
        break(choice) if choice.length > 5 && choice.length < 12
      end
    end
  end
end

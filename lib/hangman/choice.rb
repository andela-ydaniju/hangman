# Hangman module
module Hangman
  # This class serves words from file and tracks their display
  class Choice
    def initialize
      @file_content = File.readlines('./lib/hangman/5desk.txt')
    end

    def pick_word(dictionary)
      loop do
        choice = dictionary.sample.chomp.downcase
        break(choice) if choice.length > 5 && choice.length < 12
      end
    end

    def dictionary
      @file_content
    end
  end
end

# Hangman module
module Hangman
  # This class serves words from file and tracks their display
  class Choice
    def initialize
      @dictionary = File.readlines('5desk.txt')
      # @dictionary = File.readlines('../../5desk.txt')
      @word = ''
    end

    def show_word(pick_word)
      '_ ' * pick_word.length
    end

    def pick_word
      length = @dictionary.length
      (@dictionary[rand(length)]).chomp.downcase
    end
  end
end

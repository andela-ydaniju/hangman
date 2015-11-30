# Hangman module
module Hangman
  # This class serves words from file and tracks their display
  class Choice
    def initialize
      @dictionary = File.readlines('5desk.txt')
      # @dictionary = File.readlines('../../5desk.txt')
    end

    # def show_word(pick_word)
    #   '_ ' * pick_word.length
    # end

    def pick_word
      length = @dictionary.length - 1
      pick_word = (@dictionary[rand(length)]).chomp.downcase
      if pick_word.length < 5
        (@dictionary[45]).chomp.downcase
      else
        pick_word
      end
    end
  end
end

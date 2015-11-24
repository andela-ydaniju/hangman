# Hangman module
module Hangman
  # This class serves words from file and tracks their display
  class Choice
    def initialize
      @dictionary = File.readlines('5desk.txt')
      # @dictionary = File.readlines('../../5desk.txt')
      @word = ''
    end

    def pick_word
      length = @dictionary.length
      (@dictionary[rand(length)]).chomp.downcase
    end

    def show_word
      word = pick_word
      '_ ' * word.length
    end
  end
end
# p Hangman::Choice.new.pick_word

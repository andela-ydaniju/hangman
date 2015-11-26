require_relative 'choice.rb'
require 'stringio'

# Hangman module
module Hangman
  # This class follows gameplay logic
  class Play
    def initialize
      @right_guess = []
      @wrong_guess = []
      @wrong_count = 0
      @total_lives = 7
    end

    def check_guess(enter_guess)
      word = Hangman::Choice.new.pick_word
      if word.include? enter_guess
        @right_guess << enter_guess
      else
        @wrong_count += 1
        @wrong_guess << enter_guess
      end
    end

    def enter_guess
      $stdout.puts 'please  enter a letter'
      string = '3'
      while string.to_i != 0 || string.length != 1
        string = $stdin.gets.chomp.downcase
      end
      string
    end
  end
end

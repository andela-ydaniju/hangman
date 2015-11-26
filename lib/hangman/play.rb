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
    end

    def enter_guess
      $stdout.puts 'please  enter a letter'
      string = '3'
      while string.to_i != 0 || string.length != 1
        string = $stdin.gets.chomp.downcase
      end
      string
    end

    def check_guess
      guess = enter_guess
      word = Hangman::Choice.new.pick_word
      show_word = Hangman::Choice.new.show_word
      # if word is has a letter, gsub it in the word
      # then push letter to @right_guess array
      if word.include? guess
        word.each_char do |letter|
          i = 0
          # gsub(guess) {at the index where guess == char}
          puts show_word.gsub!(guess, letter) if guess == word[i]
          guess << @right_guess
          i = i + 1
        end
      else
        # Let the whole thing remain like that and then add the letter to
        # wrong_guess
        # Then increment wrong_count by 1
        guess << @wrong_guess
        @wrong_count += 1
      end
    end
  end
end
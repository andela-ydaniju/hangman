require 'hangman/version'
# Your comment goes here...
module Hangman
  require_relative './hangman/choice.rb'
  require_relative './hangman/play.rb'
  require_relative './hangman/game.rb'
end

# @right_guess = ''
# @wrong_count = 0
# @total_lives = 7
# @play = Hangman::Play.new
# @word = Hangman::Choice.new.pick_word
# @placeholder = @play.show_word(@word, '')
# puts 'Which word is:' + Hangman::Play.new.show_word(@word, '')

# while true
#    print "You have #{@total_lives - @wrong_count} chances left."
#   char = Hangman::Play.new.enter_guess
#    if @word.include? char
#      if @right_guess.include? char
#        puts char + ' is already given and accepted.'
#        puts 'Try another: ' + Hangman::Play.new.show_word(@word, @right_guess)
#      else
#        @right_guess += char
#        @placeholder = Hangman::Play.new.show_word(@word, @right_guess)

#        puts 'Great! ' + @placeholder
#      end

#      unless @placeholder.include? '*'
#        puts 'WELL DONE!! YOU SURVIVED'
#        break
#      end
#    else
#     puts "Sorry! The word doesn't contain '#{char}'"
#      @wrong_count += 1

#      if @wrong_count == @total_lives
#        puts 'YOU HANGED!'
#        p @word
#        break
#      else
#        puts 'Try another: ' + @placeholder
#      end
#    end
#  end

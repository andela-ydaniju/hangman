# Hangman module
module Hangman
  # This class starts and ends game
  class Game
    def initialize
      @right_guess = ''
      @wrong_count = 0
      @total_lives = 7
      @play = Hangman::Play.new
      @word = Hangman::Choice.new.pick_word
      @placeholder = @play.show_word(@word, @right_guess)
    end

    def start!
      puts 'Which word is:' + @play.show_word(@word, '') + '?'
      while @wrong_count < @total_lives
        print "You have #{@total_lives - @wrong_count} chances left."
        char = @play.enter_guess
        if @word.include? char
          right_entry(char)
        else
          wrong_entry(char)
        end
      end
    end

    def right_entry(char)
      if @right_guess.include? char
        puts char + ' is already given and accepted.'
        puts 'Try another: ' + @play.show_word(@word, @right_guess)
      else
        @right_guess += char
        puts 'Great! ' + @play.show_word(@word, @right_guess)
      end
      abort('WELL DONE! YOU WON!') unless @play.show_word(@word, @right_guess).
        include? '*'
    end

    def wrong_entry(char)
      puts "Sorry! The word doesn't contain '#{char}'"
      @wrong_count += 1
      if @wrong_count == @total_lives
        abort('YOU GOT HANGED!')
      else
        puts 'Try another: ' + @play.show_word(@word, @right_guess)
      end
    end
  end
end

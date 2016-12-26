module Hangman
  class Game
    attr_accessor :right_guess, :wrong_count, :show, :total_lives, :play, :word,
                  :display, :save, :entry
    def initialize
      @right_guess = ''
      @wrong_count = 0
      @total_lives = 7
      @play = Hangman::Play.new
      @word = Hangman::Choice.new.pick_word
      @display = @play.show_word(@word, @right_guess)
      @show = Hangman::Show.new
      @save = Hangman::Save.new(self)
    end

    def pre_start
      puts @show.begin
      @entry = gets.strip.downcase

      case @entry
      when 'start', 's' then start
      when 'load', 'l' then play_loaded
      else
        abort @show.help_message
      end
    end

    def start
      puts 'Which word is:' + @play.show_word(@word, '') + '?'

      condition_for_play
    end

    def play_loaded
      play_data = @save.load_data
      abort @show.wrong_load unless play_data
      @word = play_data[0].to_s
      @right_guess = play_data[1].to_s
      @wrong_count = play_data[2].to_i
      @total_lives = play_data[3].to_i
      puts @play.show_word(@word, @right_guess)

      condition_for_play
    end

    def full_game
      puts @show.continue
      play_on = gets.downcase.strip
      return @show.end if play_on != 'y'
      @word = Hangman::Choice.new.pick_word
      @wrong_count = 0
      @total_lives = 7
      @right_guess = ''
      puts @play.show_word(@word, @right_guess)

      condition_for_play
    end

    def condition_for_play
      while @wrong_count < @total_lives
        print "You have #{@total_lives - @wrong_count} chances left. "
        char = @play.enter_guess
        save_options if char =~ /[^a-zA-Z0-9_]/
        if @word.include? char
          right_entry char
        else
          wrong_entry char
        end
      end
    end

    def save_options
      puts @show.save_or_quit
      options = gets.strip.downcase

      case options
      when 'x' then @save.save_data(self)
      when 'c'
        puts @play.show_word(@word, @right_guess)
        @save.save_data condition_for_play
      else
        abort @show.end
      end
    end

    def right_entry(char)
      if @right_guess.include? char
        puts char + ' is already given and accepted.'
        puts 'Try another: ' + @play.show_word(@word, @right_guess)
      else
        @right_guess += char
        puts @show.show_right_entry + @play.show_word(@word, @right_guess)
      end
      winner_decision unless
        @play.show_word(@word, @right_guess).include? '*'
    end

    def wrong_entry(char)
      puts "Sorry! The word doesn't contain '#{char}'"
      @wrong_count += 1
      if @wrong_count == @total_lives
        puts "#{@word} + '\n' + #{@show.hang}"
        full_game
      else
        puts @show.show_wrong_entry + @play.show_word(@word, @right_guess)
      end
    end

    def winner_decision
      puts @show.show_win
      puts "\n"
      sleep 2

      full_game
    end
  end
end

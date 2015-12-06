module Hangman
# Save and load class
  class Save
    attr_reader :load_file, :word, :right_guess, :total_lives, :wrong_count

    def initialize(game)
      @game = game
    end

    def save_game(obj = nil) #, isTest = false)
      # puts "\nInput a custom name for your saved data\n"
      # username = gets.chomp.strip
      #   if username.length > 8
      #     puts "\nName too long, try again\n"
      #     save_game unless isTest
      #   elsif username.length <= 0
      #     puts "Invalid input, Try again"
      #     save_game unless isTest
      #  else
      #    @save_name = username.to_s + '.txt'
          save_data(obj)
      # end
    end

    def save_data(obj = nil)
      # require "pry"; binding.pry
      File.open('gamelog.txt', 'w+') do |line|
        line.puts obj.word
        line.puts obj.right_guess
        line.puts obj.wrong_count
        line.puts obj.total_lives
      end
      # puts @display.display_save_successful
      save_continue(obj)
    end

    def save_continue(obj = nil)
      # puts @display.display_save_continue
      @save_continue = gets.chomp.strip
      case @save_continue
      when 'c' then obj.visual_update
      when 'q' then exit
      else
        obj.exit_game
      end
    end

    def load_game(obj = nil)
      puts 'Type the name of your saved game'
      @load_username = STDIN.gets.chomp.downcase
      if File.file?('gamelog.txt')
        load_saved_file(obj)
      else
        load_failed(@game_play)
      end
    end

    def load_failed(obj = nil)
      # puts @display.display_load_failed
      puts 'LOAD FAILED'
      sleep 1
      obj.get_user_input
    end

    def load_saved_file(obj = nil)
      @load_file = File.readlines('gamelog.txt')
      @load_file.map!.chomp { |item| item.chomp }
      # p @load_file
      continue_loaded_game(obj)
    end

    def continue_loaded_game(obj = nil)
      @word = load_file[0].chars
      @right_guess = load_file[1].chars
      @wrong_count = load_file[2].to_i
      @total_lives = load_file[3].to_i
      obj = obj || Game.new
      # require "pry"; binding.pry
      obj.load_saved_game(word, right_guess, wrong_count, total_lives)
    end
  end
end

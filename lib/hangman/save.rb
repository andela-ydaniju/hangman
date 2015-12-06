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
      play_data = [obj.word, obj.right_guess, obj.wrong_count, obj.total_lives]
      serialized_data = YAML.dump(play_data)
      # File.open('gamelog.txt', 'w') { |line| line.write(serialized_data) }
      puts 'Game successfully saved'
      serialized_data
    end

    def load_data(obj=nil)
      deserialize = YAML.load(obj)
      @word = deserialize[0].to_s
      @right_guess = deserialize[1].to_s
      @wrong_count = deserialize[2].to_i
      @total_lives = deserialize[3].to_i
      show_word(@word, @right_guess)
    end
  end
end

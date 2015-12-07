require 'yaml'
module Hangman
# Save and load class
  class Save
    attr_reader :load_file, :word, :right_guess, :total_lives, :wrong_count

    def initialize(game)
      @game = game
      @play = Hangman::Play.new
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
      play_data = [obj.word, obj.right_guess, obj.wrong_count, obj.total_lives]
      serialized_data = YAML.dump(play_data)
      data = File.open('gamelog.yml', 'w') { |line| line.write(serialized_data) }
      if data
        puts 'Game successfully saved'
        exit
      end
    end

    def load_data
      read_file = File.read('gamelog.yml')
      YAML.load(read_file)
    end
  end
end

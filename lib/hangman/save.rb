module Hangman
  class Save
    attr_reader :word, :right_guess, :total_lives, :wrong_count

    def initialize(game)
      @game = game
      @play = Hangman::Play.new
    end

    def save_data(obj = nil)
      play_data = [obj.word, obj.right_guess, obj.wrong_count, obj.total_lives]
      serialize_data = YAML.dump(play_data)
      data = File.open('gamelog.yml', 'w') { |line| line.write(serialize_data) }
      if data
        puts 'Game successfully saved'
        sleep 3
        exit
      end
    end

    def load_data
      read_file = File.read('gamelog.yml')
      YAML.load(read_file)
    end
  end
end

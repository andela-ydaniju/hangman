module Hangman
  class Choice
    attr_accessor :file_path
    def initialize
      @file_path = '5desk.txt'
      @word_list = read_file(@file_path)
    end

    def read_file(dictionary)
      File.readlines(dictionary)
    end

    def pick_word
      loop do
        choice = @word_list.sample.chomp.downcase
        break(choice) if choice.length > 5 && choice.length < 12
      end
    end
  end
end

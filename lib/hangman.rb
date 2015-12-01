require 'hangman/version'
# Your comment goes here...
module Hangman
  require_relative './hangman/choice.rb'
  require_relative './hangman/play.rb'
  require_relative './hangman/game.rb'

  # serialized_object = Marshal::dump(Hangman::Game.new.start!)
  # puts Marshal::load(serialized_object)
end

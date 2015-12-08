require 'coveralls'
Coveralls.wear!
require 'spec_helper'
# Test for Save class
module Hangman
  game = Game.new
  save = Save.new(game)

  context '#initialize' do
    it 'is an instance of Save' do
      expect(save.class).to be Save
    end
  end

  context '#method_calls' do
    it 'return true to these calls' do
      allow(game).to receive(:word).and_return(true)
      allow(game).to receive(:wrong_count).and_return(true)
      allow(game).to receive(:right_guess).and_return(true)
      allow(game).to receive(:wrong_entry).and_return(true)
    end
  end

  context 'load_data' do
    it 'returns array' do
      expect(save.load_data[3]).to eq 7
    end
  end
end

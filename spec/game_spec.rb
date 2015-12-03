require 'coveralls'
Coveralls.wear!
require 'spec_helper'
# Test for Game class
module Hangman
  describe Game do
    let(:play) { Hangman::Play.new }
    let(:game) { Hangman::Game.new }
    # before do
    #   $stdin = StringIO.new('a')
    # end

    # after do
    #   $stdin = STDIN
    # end

    context '#method_calls' do
      it 'receives right method calls' do
        allow(game).to receive(:word).and_return(true)
        allow(game).to receive(:wrong_count).and_return(true)
        allow(game).to receive(:right_guess).and_return(true)
        allow(game).to receive(:wrong_entry).and_return(true)
        allow(game).to receive(:total_lives).and_return(true)
        allow(game).to receive(:display).and_return(true)
        allow(game).to receive(:start!).and_return('wibble')
      end
      it 'rejects wrong method calls' do
        allow(game).to receive(:yusuf).and_return(false)
        allow(game).to receive(:failure).and_return(false)
      end
    end

    context 'wrong_entry' do
      it 'cannot play wrong more than 7 times' do
        expect(game).to receive(:wrong_entry).at_most(7).times
      end

      it 'it reports loss ' do
        allow(play).to receive(:show_word).and_return('amaka')
        allow(game).to receive(:right_guess).and_return('m')
        allow(game).to receive(:wrong_count).and_return(3)
        allow(game).to receive(:right_guess).and_return('m')
        expect(game.wrong_entry('q')).to eql nil
      end
    end
  end
end

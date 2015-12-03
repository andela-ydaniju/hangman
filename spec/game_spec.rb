require 'coveralls'
Coveralls.wear!
require 'spec_helper'
# Test for Game class
module Hangman
  hangman_play = Hangman::Play.new
  hangman_choice = Hangman::Choice.new
  describe Game do
    # before do
    #   $stdin = StringIO.new('a')
    # end

    # after do
    #   $stdin = STDIN
    # end

    context '#method_calls' do
      it 'receives right method calls' do
        allow(hangman_play).to receive(:word).and_return(true)
        allow(hangman_play).to receive(:wrong_count).and_return(true)
        allow(hangman_play).to receive(:right_guess).and_return(true)
        allow(hangman_play).to receive(:total_lives).and_return(true)
        allow(hangman_play).to receive(:play).and_return(true)
        allow(hangman_play).to receive(:display).and_return(true)
        allow(hangman_play).to receive(:start!).and_return('wibble')
      end
      it 'rejects wrong method calls' do
        allow(hangman_play).to receive(:yusuf).and_return(false)
        allow(hangman_play).to receive(:failure).and_return(false)
      end
    end

    context ''
  end
end

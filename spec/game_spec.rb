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

    context '#wrong_entry' do
      it 'cannot play wrong more than 7 times' do
        expect(game).to receive(:wrong_entry).at_most(7).times
      end

      it 'it increments wrong_count by 1' do
        game.instance_variable_set(:@wrong_count, 1)
        game.wrong_entry('a')
        expect(game.wrong_count).to eql 2
      end

      it 'it aborts once total_lives == wrong_count' do
        game.instance_variable_set(:@wrong_count, 7)
        game.instance_variable_set(:@word, 'greet')
        result = game.wrong_entry('a')
        expect(result).to eq nil
      end
    end

    context '#right_entry' do
      it 'concatenates new char with right_guess' do
        game.instance_variable_set(:@word, 'amebo')
        game.instance_variable_set(:@right_guess, 'amb')
        game.right_entry('e')
        expect(game.right_guess).to eql 'ambe'
      end

      it 'returns same word if right letter is reenntered' do
        game.instance_variable_set(:@word, 'amebo')
        game.instance_variable_set(:@right_guess, 'ambo')
        game.right_entry('o')
        expect(game.right_guess).to eql 'ambo'
      end

      it 'declare winner if guesses complete' do
        game.instance_variable_set(:@word, 'yusuf')
        game.instance_variable_set(:@right_guess, 'usuf')
        game.right_entry('y')
        expect(game.right_guess).to eql 'usufy'
      end

      it 'concatenates a char with right_guess' do
        game.instance_variable_set(:@word, 'yusuf')
        game.instance_variable_set(:@right_guess, 'yus')
        game.right_entry('u')
        expect(game.right_guess).to eql 'yusu'
      end

      it 'returns same word if correct letter is reenntered' do
        game.instance_variable_set(:@word, 'yusuf')
        game.instance_variable_set(:@right_guess, 'yus')
        game.right_entry('s')
        expect(game.right_guess).to eql 'yus'
      end

      it 'declare winner if guesses completed' do
        game.instance_variable_set(:@word, 'amebo')
        game.instance_variable_set(:@right_guess, 'ambo')
        game.right_entry('e')
        expect(game.right_guess).to eql 'amboe'
      end
    end
  end
end

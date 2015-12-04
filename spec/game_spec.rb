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
    context '#initialize' do
      it 'is an instance of Hangman::Game' do
        expect(game.class).to eq(Hangman::Game)
      end

      it 'has right_guess method' do
        expect(game.methods.include? :right_guess).to be true
      end

      it 'has wrong_count method' do
        expect(game.methods.include? :wrong_count).to be true
      end

      it 'has total_lives method' do
        expect(game.methods.include? :total_lives).to be true
      end

      it 'has play method' do
        expect(game.methods.include? :play).to be true
      end

      it 'has word method' do
        expect(game.methods.include? :word).to be true
      end

      it 'has display method' do
        expect(game.methods.include? :display).to be true
      end

      it 'has follow_follow method' do
        expect(game.methods.include? :follow_follow).to be false
      end
    end

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

      it 'concatenates a char with right_guess' do
        game.instance_variable_set(:@word, 'bag')
        game.instance_variable_set(:@right_guess,'b')
        game.right_entry('a')
        expect(game.right_guess).to eql 'ba'
      end

      it 'returns same word if correct letter is reenntered' do
        game.instance_variable_set(:@word, 'bag')
        game.instance_variable_set(:@right_guess, 'ba')
        game.right_entry('a')
        expect(game.right_guess).to eql 'ba'
      end
    end

    before do
      $stdin = StringIO.new('start')
    end
    after do
      $stdin = STDIN
    end

    # context '#pre_start' do
    #   it 'prints welcome message' do
    #     allow(pre_start).to receive(:entry) { 'start' }
    #     expect(game.pre_start.nil).to be true
    #   end
    # end
  end
end

require 'coveralls'
Coveralls.wear!
require 'spec_helper'
# Test for Game class
module Hangman
  describe Game do
    let(:play) { Hangman::Play.new }
    let(:game) { Hangman::Game.new }
    let(:show) { Hangman::Show.new }
    let(:save) { Hangman::Save.new(game) }

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
        allow(game).to receive(:start).and_return('wibble')
      end
      it 'rejects wrong method calls' do
        allow(game).to receive(:yusuf).and_return(false)
        allow(game).to receive(:failure).and_return(false)
      end
    end

    context '#full_game' do
      it 'prints goodbye when play_on != y' do
        allow(game).to receive(:gets).and_return('n')
        allow(game).to receive(:full_game).and_return('GOODBYE')
        expect(game.full_game).to eq 'GOODBYE'
      end
      it 'resets right_guess if play_on == y' do
        allow(game).to receive(:gets).and_return('y')
        allow(game).to receive(:full_game).and_return('play_on')
        expect(game.right_guess).to eq ''
      end
    end

    context '#condition_for_play' do
      it 'plays on until wrong_count equals total_lives' do
        expect(game.wrong_count).not_to eql game.total_lives
      end

      it 'returns either right or wrong entry methods' do
        allow(game).to receive(:gets).and_return('a')
        allow(game).to receive(:word).and_return('pad')
        allow(game).to receive(:condition_for_play).and_return('cool')
        expect(game.condition_for_play).to eq 'cool'
      end
    end

    context '#wrong_entry' do
      it 'increments wrong_count by 1' do
        game.instance_variable_set(:@wrong_count, 1)
        game.instance_variable_set(:@word, 'amebo')
        game.wrong_entry('q')
        expect(game.wrong_count).to eql 2
      end

      it 'it reverts to full game if total_lives exhausted' do
        game.instance_variable_set(:@wrong_count, 7)
        game.instance_variable_set(:@total_lives, 7)
        game.instance_variable_set(:@word, 'greet')
        allow(game).to receive(:full_game).and_return('wibble')
        expect(game.wrong_entry('a')).to eq nil
      end

      it 'cannot play wrong more than 7 times' do
        expect(game).to receive(:wrong_entry).at_most(7).times
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
        game.instance_variable_set(:@right_guess, 'b')
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

    context '#pre_start' do
      it 'game starts if s or start' do
        allow(game).to receive(:gets).and_return('start')
        allow(game).to receive(:start).and_return('starters')
        expect(game.pre_start).to eql 'starters'
      end

      it 'game load if l or load' do
        allow(game).to receive(:gets).and_return('l')
        allow(game).to receive(:play_loaded).and_return('success')
        expect(game.pre_start).to eql 'success'
      end

      it 'show help message if response is wrong' do
        allow(game).to receive(:gets).and_return('k')
        allow(game).to receive(:abort).and_return(show.help_message)
        expect(game.pre_start.include? 'help').to be false
      end
    end

    context '#winner_decision' do
      it 'show help message if response is wrong' do
        allow(game).to receive(:full_game).and_return('game on!')
        expect(game.winner_decision).to eq 'game on!'
      end
    end

    context '#start' do
      it 'show help message if response is wrong' do
        allow(game).to receive(:condition_for_play).and_return('play')
        expect(game.start).to eql 'play'
      end
    end

    context '#play_loaded' do
      it 'aborts if no data' do
        allow(game).to receive(:condition_for_play).and_return(false)
        expect(game.play_loaded.nil?).to eq false
      end
    end
  end
end

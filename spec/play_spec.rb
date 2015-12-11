require 'coveralls'
Coveralls.wear!
require 'spec_helper'
module Hangman
  hangman_play = Hangman::Play.new
  describe Play do
    context 'enter_guess' do
      it 'returns a string' do
        allow(hangman_play).to receive(:gets).and_return('a')
        expect(hangman_play.enter_guess.class).to eql String
      end

      it "should return 'a'" do
        allow(hangman_play).to receive(:gets).and_return('a')
        expect(hangman_play.enter_guess).to eql 'a'
      end

      it 'cannot be an empty string' do
        allow(hangman_play).to receive(:gets).and_return('a')
        expect(hangman_play.enter_guess.length).not_to eql 0
      end
    end

    context 'show_word' do
      picked_word = Hangman::Choice.new.pick_word
      showed_word = Play.new.show_word(picked_word, 'a')
      it 'is a string' do
        expect(showed_word.class).to be String
      end

      it "returns '*' in place of a letter in a word" do
        expect(showed_word.include? '*').to eql true
      end

      it "has same length with 'pick_word'" do
        expect(showed_word.length).to eql picked_word.length
      end
    end
  end
end

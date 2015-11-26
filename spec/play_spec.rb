require 'coveralls'
Coveralls.wear!
require 'spec_helper'
# Test for Play class
module Hangman
  hangman_play = Hangman::Play.new
  describe Play do
    context 'guess' do
      before do
        $stdin = StringIO.new('a')
      end

      after do
        $stdin = STDIN
      end

      it 'returns a string' do
        expect(hangman_play.enter_guess.class).to eql String
      end

      it "should return 'a'" do
        expect(hangman_play.enter_guess).to eql 'a'
      end

      it 'cannot be an empty string' do
        expect(hangman_play.enter_guess.length).not_to eql 0
      end
    end
  end
end

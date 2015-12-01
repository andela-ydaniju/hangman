require 'coveralls'
Coveralls.wear!
require 'spec_helper'
# Test for Choice class
module Hangman
  describe Choice do
    picked_word = Choice.new.pick_word
    context 'pick_word' do
      it 'returns a string in downcase' do
        expect(picked_word.class).to eql String
      end
      it 'cannot be an empty string' do
        expect(picked_word.length).not_to eql 0
      end

      it 'cannot be a sring with length < 5' do
        expect(picked_word.length).not_to eql 4
      end

      it 'cannot be a sring with length < 5' do
        expect(picked_word.length).not_to eql 3
      end

      it 'cannot be a sring with length < 5' do
        expect(picked_word.length).not_to eql 2
      end

      it 'cannot be a sring with length < 5' do
        expect(picked_word.length).not_to eql 1
      end
    end
  end
end

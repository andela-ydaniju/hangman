require 'coveralls'
Coveralls.wear!
require 'spec_helper'
# Test for Choice class
module Hangman
  describe Choice do
    choice = Choice.new
    picked_word = choice.pick_word
    context '#pick_word' do
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
    context '#read_file' do
      it 'returns an array' do
        expect(choice.read_file("x").class).to eq(Array)
      end
    end

    context '#initialize' do
      it 'be an instance of Hangman::Choice' do
        expect(choice.class).to eq(Hangman::Choice)
      end
    end
  end
end


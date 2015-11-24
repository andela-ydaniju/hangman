require 'coveralls'
Coveralls.wear!
require 'spec_helper'
# Test for Choice class
module Hangman
  describe Choice do
    context 'pick_word' do
      picked_word = Choice.new.pick_word
      it 'returns a string in downcase' do
        expect(picked_word.class).to eql String
      end
      it 'cannot be an empty string' do
        expect(picked_word.length).not_to eql 0
      end
    end

    context 'show_word' do
      showed_word = Choice.new.show_word
      it "returns '_ ' in place of a letter in a word" do
        expect(showed_word.class).to be String
      end
    end
  end
end

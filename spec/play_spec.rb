require 'coveralls'
Coveralls.wear!
require 'spec_helper'

# Test for Play class
module Hangman
  describe Play do
    context 'guess' do
      it 'returns a string in downcase' do
        expect(Hangman::Play.new.enter_guess.class).to eql String

        
      end
      # it 'cannot be an empty string' do
      #   expect(picked_word.length).not_to eql 0
      # end
    end
  end
end

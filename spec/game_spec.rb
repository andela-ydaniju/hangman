require 'coveralls'
Coveralls.wear!
require 'spec_helper'
# Test for Game class
module Hangman
  describe Game do
    before do
      $stdin = StringIO.new('a')
    end

    after do
      $stdin = STDIN
    end
    # context 'wrong_entry' do
    #   it 'increment wrong_count' do
    #     expect("farm".wrong_entry('b')).to
    #   end
    # end
  end
end

require 'coveralls'
Coveralls.wear!
require 'spec_helper'
# Test for Show class
module Hangman
  show = Hangman::Show.new
  describe Show do
    context '#begin' do
      it "prints welcome message" do
        expect(show.begin.class).to be String
      end

      it "should include WELCOME" do
        expect(show.begin.include? 'WELCOME').to be true
      end
    end

    context '#show_right_entry' do
      it "prints reight_entry message" do
        expect(show.show_right_entry.class).to be String
      end

      it "should include GREAT" do
        expect(show.show_right_entry.include? 'GREAT').to be true
      end
    end

    context '#show_wrong_entry' do
      it "prints wrong entry message" do
        expect(show.show_wrong_entry.class).to be String
      end

      it "should include TRY AGAIN" do
        expect(show.show_wrong_entry.include? 'TRY AGAIN').to be true
      end
    end

    context '#show_win' do
      it "prints congratulatory message" do
        expect(show.show_win.class).to be String
      end

      it "should include WON" do
        expect(show.show_win.include? 'WON').to be true
      end
    end

    context '#hang' do
      it "prints hang/defeat message" do
        expect(show.hang.class).to be String
      end

      it "should include GAME-OVER" do
        expect(show.hang.include? 'GAME-OVER').to be true
      end
    end
  end
end

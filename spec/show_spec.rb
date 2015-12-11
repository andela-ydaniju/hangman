require 'coveralls'
Coveralls.wear!
require 'spec_helper'
module Hangman
  show = Hangman::Show.new
  describe Show do
    context '#begin' do
      it 'prints welcome message' do
        expect(show.begin.class).to be String
      end

      it 'should include WELCOME' do
        expect(show.begin.include? 'WELCOME').to be true
      end
    end

    context '#show_right_entry' do
      it 'prints reight_entry message' do
        expect(show.show_right_entry.class).to be String
      end

      it 'should include GREAT' do
        expect(show.show_right_entry.include? 'GREAT').to be true
      end
    end

    context '#show_wrong_entry' do
      it 'prints wrong entry message' do
        expect(show.show_wrong_entry.class).to be String
      end

      it 'should include TRY AGAIN' do
        expect(show.show_wrong_entry.include? 'TRY AGAIN').to be true
      end
    end

    context '#show_win' do
      it 'prints congratulatory message' do
        expect(show.show_win.class).to be String
      end

      it 'should include WON' do
        expect(show.show_win.include? 'WON').to be true
      end
    end

    context '#hang' do
      it 'prints hang/defeat message' do
        expect(show.hang.class).to be String
      end

      it 'should include GAME-OVER' do
        expect(show.hang.include? 'GAME-OVER').to be true
      end

      it 'should include GAME-OVER' do
        expect(show.hang.include? ':(').to be true
      end
    end

    context '#continue' do
      it 'prints continue message' do
        expect(show.continue.class).to be String
      end

      it 'should include GAME-OVER' do
        expect(show.continue.include? 'CONTINUE').to be true
      end
    end

    context '#end' do
      it 'prints end message' do
        expect(show.end.class).to be String
      end

      it 'should include GOODBYE' do
        expect(show.end.include? 'GOODBYE').to be true
      end
    end

    context '#save_or_quit' do
      it 'prints save_or_quit message' do
        expect(show.save_or_quit.class).to be String
      end

      it 'should include SAVE' do
        expect(show.save_or_quit.include? 'SAVE').to be true
      end
    end

    context '#wrong_load' do
      it 'prints wrong_load message' do
        expect(show.wrong_load.class).to be String
      end

      it "should include 'NO SAVED GAME'" do
        expect(show.wrong_load.include? 'NO SAVED GAME').to be true
      end
    end

    context '#help_message' do
      it 'prints help message' do
        expect(show.help_message.class).to be String
      end

      it 'should include save' do
        expect(show.help_message.include? 'q - quit').to be true
      end
    end

    context '#partial_help_message' do
      it 'prints part of help message' do
        expect(show.partial_help_message.class).to be String
      end

      it 'should include save' do
        expect(show.partial_help_message.include? 'hangman').to be true
      end
    end
  end
end

require 'coveralls'
Coveralls.wear!
require 'spec_helper'
# Test for Save class.
module Hangman
  describe Save do
    include FakeFS::SpecsHelper

    it "should return a file with its content having a line length of 140 characters" do
      # This is like the first safety check. Run this before your File Operations
      FakeFS.activate!

      # This is something special, it will take a while to load everytime you run
      # the test, so don't panic if you're wondering why it appears that the test
      # is "stuck". This stubs your existing Filesystem.
      FakeFS::FileSystem.clone(Rails.root)

      file = generate_file_and_return_filename('magic_happens_here')

      File.readlines(file).each do |line|
        expect(line.length).to eq(141)
      end

      FakeFS.deactivate!
    end
    game = Game.new
    save = Save.new(game)

    context '#initialize' do
      it 'is an instance of Save' do
        expect(save.class).to be Save
      end
    end

    context '#method_calls' do
      it 'return true to these calls' do
        allow(game).to receive(:word).and_return(true)
        allow(game).to receive(:wrong_count).and_return(true)
        allow(game).to receive(:right_guess).and_return(true)
        allow(game).to receive(:wrong_entry).and_return(true)
      end
    end
  end
end

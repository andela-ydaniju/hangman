require 'coveralls'
Coveralls.wear!
require 'spec_helper'
module Hangman
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

  context '#load_data' do
    it 'should load yaml' do
      yaml_text = <<-EOF
                    A_NAME: ABC
                    A_ALIAS: my_alias
                  EOF
      yaml = YAML.load(yaml_text)
      filepath = 'whatever.yml'
      YAML.stub(:load_data).with(filepath).and_return(yaml)
    end
  end

  context '#save_data' do
    it 'should save to yaml' do
      yaml_text = <<-EOF
                    A_NAME: ABC
                    A_ALIAS: my_alias
                  EOF
      yaml = YAML.dump(yaml_text)
      filepath = 'whatever.yml'
      YAML.stub(:save_data).with(filepath).and_return(yaml)
    end
  end
end

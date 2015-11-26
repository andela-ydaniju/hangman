require 'coveralls'
Coveralls.wear!
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

module Helpers
  # Replace standard input with faked one StringIO. 
  def fake_stdin(text)
    begin
      $stdin = StringIO.new
      $stdin.puts(text)
      $stdin.rewind
      yield
    ensure
      $stdin = STDIN
    end
  end
end
RSpec.configure do |conf|
  conf.include(Helpers)
end
require 'hangman'

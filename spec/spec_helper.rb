require 'coveralls'
Coveralls.wear!
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
# SimpleCov.start do
#   add_filter '/vendor/' # Ignores any file containing "/vendor/" in its path.
#   add_filter '/lib/myfile.rb' # Ignores a specific file. 
# end
require 'hangman'

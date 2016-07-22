$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rex/bin_tools'

Dir[File.join(File.dirname(__FILE__), "support/**/*.rb")].each { |f| require f}
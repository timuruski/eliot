require 'eliot'
include Eliot

SPEC_DIR = File.dirname(__FILE__)

RSpec.configure do |config|
  config.color = true
  config.order = 'rand'
end

require 'rspec'
require_relative '../lib/open_weather'
require 'dotenv'

Dotenv.load('.env')

RSpec.configure do |config|
  config.formatter = :documentation
end

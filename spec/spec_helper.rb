require 'rspec'
require 'dotenv'
require 'httparty'

require_relative '../lib/open_weather'
Dotenv.load('.env')

RSpec.configure do |config|
  config.formatter = :documentation
end

require 'rspec'
require_relative '../lib/open_weather'
require 'dotenv'
require 'httparty'
Dotenv.load('.env')

RSpec.configure do |config|
  config.formatter = :documentation
end

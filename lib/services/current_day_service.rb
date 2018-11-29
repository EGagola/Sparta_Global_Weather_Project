require 'httparty'
require 'json'
require_relative '../generators/id_generator'

class CurrentDayService
  include HTTParty

  base_uri 'https://samples.openweathermap.org'

  def initialize
    @current_weather = CityIdGenerator.new
    @current_weather = @current_weather.weather
  end

  def test
    @current_weather
  end

  def key_value
    @current_weather['sys']['type']
  end

  def country_string
    @current_weather['sys']['country']
    # test id for id it should retunr integer
    #name should have type sting
    #code should return an integer
  end

  def sys_id_float
    @current_weather['sys']['id']
  end

  def method_name

  end
end

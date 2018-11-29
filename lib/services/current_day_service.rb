require 'httparty'
require 'json'
require_relative '../generators/id_generator'

class CurrentDayService
  include HTTParty

  base_uri 'https://samples.openweathermap.org'

  def initialize
    @current_weather = CityIdGenerator.new.weather
  end

  def test
    @current_weather
  end

  def get_base
    @current_weather['base']
  end

  def get_main
    @current_weather['main'].length
  end

  def get_visibility
    @current_weather['visibility']
  end

  def get_wind_speed
    @current_weather['wind']['speed']
  end

  def get_wind_deg
    @current_weather['wind']['deg']
  end

end

new = CurrentDayService.new
puts new.test

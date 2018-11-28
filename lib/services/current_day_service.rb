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

  def longitude_value
    @current_weather['coord']['lon']
  end

  def latitude_value
    @current_weather['coord']['lat']
  end

  def id_value
    @current_weather['weather'][0]['id']
  end

  def main_value
    @current_weather['weather'][0]['main']
  end

  def description_value
    @current_weather['weather'][0]['description']
  end

  def icon_value
    @current_weather['weather'][0]['icon']
  end

  def weather_key_value
    @current_weather['weather'][0].keys.length
  end

  def coordinates_key_value
    @current_weather['coord'].keys.length
  end

  def main_key_value
    @current_weather['main'].keys.length
  end

end

new = CurrentDayService.new
puts new.main_key_value

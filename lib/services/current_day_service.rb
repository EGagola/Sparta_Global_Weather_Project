require 'httparty'
require 'json'

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
end

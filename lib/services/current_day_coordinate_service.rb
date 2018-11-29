require 'httparty'
require 'json'
require_relative '../generators/coordinates_generator'


class CurrentDayCoordinateService
  include HTTParty

  def initialize
    @json_file = ParseJSON.new
    random_val = @json_file.generate_random_number
    @latitude = @json_file.get_coord(random_val,'lat')
    @longitude = @json_file.get_coord(random_val,'lon')
    @current_day = {}
  end

  def get_current_day_data(api_key)
    @current_day = JSON.parse(self.class.get("http://api.openweathermap.org/data/2.5/weather?lat=#{@latitude}&lon=#{@longitude}&APPID=#{api_key}").body)
  end

  def search_outer(search_word)
    @current_day["#{search_word}"]
  end

  def search_weather_for(search_word)
    @current_day['weather'][0]["#{search_word}"]
  end

  def search_input_for(input, search_word)
    @current_day["#{input}"]["#{search_word}"]
  end

end

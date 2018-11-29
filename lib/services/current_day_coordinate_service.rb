require 'httparty'
require 'json'

class CurrentDayCoordinateService
  include HTTParty

  def initialize
    # placeholders for the generator functions
    @latitude = 35
    @longitude = 139
    @current_day = {}
  end

  def get_current_day_data(api_key)
    # api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}
    @current_day = JSON.parse(self.class.get("http://api.openweathermap.org/data/2.5/weather?lat=#{@latitude}&lon=#{@longitude}&APPID=#{api_key}").body)
  end

  def search_outer(search_word)
    @five_day_forecast["#{search_word}"]
  end

  def search_weather_for(search_word)
    @five_day_forecast['weather'][0]["#{search_word}"]
  end

  def search_input_for(input, search_word)
    @five_day_forecast["#{input}"]["#{search_word}"]
  end

end

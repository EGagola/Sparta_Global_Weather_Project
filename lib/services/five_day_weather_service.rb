require 'httparty'
require 'json'

class FiveDayService
  include HTTParty

  def initialize
    # placeholders for the generator functions
    @json_file = ParseJSON.new
    @latitude = @json_file.get_coord(100,'lat')
    @longitude = @json_file.get_coord(,'lon')
    @five_day_forecast = {}
  end

  def get_five_day_data(api_key)
    @five_day_forecast = JSON.parse(self.class.get("https://api.openweathermap.org/data/2.5/forecast?lat=#{@latitude}&lon=#{@longitude}&APPID=#{api_key}").body)
  end

  def search_outer(search_word)
    @five_day_forecast["#{search_word}"]
  end

  def search_inside_city_for(search_word)
    @five_day_forecast['city']["#{search_word}"]
  end

  def search_list_for(iterator, search_word)
    @five_day_forecast['list'][iterator]["#{search_word}"]
  end

  def search_weather_for(iterator, search_word)
    @five_day_forecast['list'][iterator]['weather'][0]["#{search_word}"]
  end

  def search_list_input_for(iterator, input, search_word)
    @five_day_forecast['list'][iterator]["#{input}"]["#{search_word}"]
  end

end

require 'httparty'
require 'json'

class FiveDayService
  include HTTParty


  def initialize
    @longitude = 20
    @latitude = 30
    @five_day_forecast = 0
  end


  def get_five_day_data(api_key)
    @five_day_forecast = JSON.parse(self.class.get("http://api.openweathermap.org/data/2.5/forecast?lat=#{@latitude}&lon=#{@longitude}&APPID=#{api_key}").body)
  end

  def get_list
    @five_day_forecast['list']
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

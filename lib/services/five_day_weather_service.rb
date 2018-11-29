require 'httparty'
require 'json'
require 'date'
class FiveDayService
  include HTTParty

  def initialize
    # placeholders for the generator functions
    @coordinates = CoordsGenerator.new
    @latitude = @coordinates.generate_latitude
    @longitude = @coordinates.generate_longitude
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

  def delta_text_check(instance)
    dt_text_input = instance.search_list_for(0, "dt_txt")
    deltatime = instance.search_list_for(0, 'dt')
    dt_text_input = DateTime.parse(dt_text_input).to_time.to_i
    if dt_text_input == deltatime
       true
    else
      false
    end
  end
  def dt_txt_formatter(instance)
    dt_text_input = instance.search_list_for(0, "dt_txt")
    dt_txt_array = dt_text_input.split(" ")
    dt_txt_array[0]
  end
end

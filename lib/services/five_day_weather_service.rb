require 'httparty'
require 'json'
require 'date'
require_relative '../generators/coordinates_generator'

class FiveDayService
  include HTTParty

  def initialize
    @json_file = ParseJSON.new
    random_val = @json_file.generate_random_number
    @latitude = @json_file.get_coord(random_val,'lat')
    @longitude = @json_file.get_coord(random_val,'lon')
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

  def dt_txt_format_checker(instance)
    true_values = 0
    #true_values represents how many test cases are true and therefore correct.
    # 4 cases are tested
    dt_text_input = instance.search_list_for(0, "dt_txt")
    dt_txt_array = dt_text_input.split(" ")
    y, m, d = dt_txt_array[0].split '-'
    dt_txt_time_array = dt_txt_array[1].split ':'
    if (Date.valid_date? y.to_i, m.to_i, d.to_i)
      #Date Check
      true_values += 1
    end
    if (0 <= dt_txt_time_array[0].to_i && dt_txt_time_array[0].to_i <= 23)
      true_values += 1
      #Hours check
    end
    if (0 <= dt_txt_time_array[1].to_i && dt_txt_time_array[1].to_i <=59)
      true_values += 1
      #Minutes check
    end
    if (0 <= dt_txt_time_array[2].to_i && dt_txt_time_array[2].to_i <= 59)
      true_values += 1
      #Seconds Check
    end
    true_values
    #expecting 4
  end
end

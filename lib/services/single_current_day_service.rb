require 'httparty'
require 'json'
require_relative '../generators/id_generator'

class CurrentDayService
  include HTTParty

  def initialize
    @single_weather_data = 0
  end

  def get_single_weather_id(cityid, api_key)
    @single_weather_data = JSON.parse(self.class.get("https://api.openweathermap.org/data/2.5/group?id=#{cityid}&APPID=#{api_key}").body)
  end

  def get_id
    @single_weather_data['list'][0]['id'].to_s.split ''
  end

  def get_result
    @single_weather_data
  end

  def get_base_value
    @single_weather_data['base']
  end

  def get_main_value
    @single_weather_data['main'].length
  end

  def get_visibility_value
    @single_weather_data['visibility']
  end

  def get_wind_speed_value
    @single_weather_data['wind']['speed']
  end

  def get_wind_deg_value
    @single_weather_data['wind']['deg']
  end

  def get_key_value
    @single_weather_data['sys']['type']
  end

  def get_country_value
    @single_weather_data['sys']['country']
  end

  def get_sys_id_value
    @single_weather_data['sys']['id']
  end

  def get_longitude_value
    @single_weather_data['list'][0]['coord']['lon']
  end

  def get_latitude_value
    @single_weather_data['list'][0]['coord']['lat']
  end

  def get_weather_id
    @single_weather_data['list'][0]['weather'][0]['id']
  end

  def get_weather_id_count
    @single_weather_data['list'][0]['weather'][0]['id'].to_s.split ''
  end

  def get_weather
    @single_weather_data['list'][0]['weather'].keys.length
  end

  def get_main_value
    @single_weather_data['weather'][0]['main']
  end

  def get_description_value
    @single_weather_data['weather'][0]['description']
  end

  def get_icon_value
    @single_weather_data['list'][0]['weather'][0]['icon']
  end

  def get_description_value
    @single_weather_data['list'][0]['weather'][0]['description']
  end

  def get_description_value_count
    @single_weather_data['list'][0]['weather'][0]['description'].split('')
  end

  def get_weather_length
    @single_weather_data['list'][0]['weather'][0].keys.length
  end

  def get_coordinates_key_value
    @single_weather_data['coord'].keys.length
  end

  def get_main_key_value
    @single_weather_data['main'].keys.length
  end
end

require 'httparty'
require 'json'
require_relative '../generators/id_generator'

class CurrentDayService
  include HTTParty

  base_uri 'api.openweathermap.org'

  def initialize
    @current_weather = weather('2332453')
  end

  def weather(cityID)
    JSON.parse(self.class.get("/data/2.5/group?id=#{cityID}&APPID=a210fbef76875d625711834647e06f34").body)
  end


  def get_result
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

  def key_value
    @current_weather['sys']['type']
  end

  def country_string
    @current_weather['sys']['country']
    # test id for id it should retun integer
    #name should have type sting
    #code should return an integer
  end

  def sys_id_float
    @current_weather['sys']['id']
  end

  def get_longitude
    @current_weather['coord']['lon']
  end

  def get_latitude
    @current_weather['coord']['lat']
  end

  def get_id
    @current_weather['weather'][0]['id']
  end

  def main_value
    @current_weather['weather'][0]['main']
  end

  def get_description
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

puts new = CurrentDayService.new

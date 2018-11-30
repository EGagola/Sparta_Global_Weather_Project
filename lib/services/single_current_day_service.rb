require 'httparty'
require 'json'
require_relative '../generators/id_generator'

class CurrentDayService
  include HTTParty

  def initialize
    @cityid = CityIdGenerator.new.single_generator
    @single_weather_data = 0
  end

  def get_single_weather_id(api_key)
    @single_weather_data = JSON.parse(self.class.get("https://api.openweathermap.org/data/2.5/group?id=#{@cityid}&APPID=#{api_key}").body)
  end
end
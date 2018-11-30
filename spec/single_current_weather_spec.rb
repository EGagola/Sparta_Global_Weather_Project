require_relative '../lib/generators/id_generator'

describe OpenWeather do

  attr_accessor :api_key

  before(:all) do
    @api_key = ENV['OPENWEATHER_API_KEY']
    @single_weather_service = OpenWeather.new.single_weather_service
    @single_weather_service.get_single_weather_id(@api_key)
  end

end

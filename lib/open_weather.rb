require_relative 'services/current_day_service'
require_relative 'services/five_day_weather_service'
require_relative 'services/current_day_coordinate_service'
require_relative 'generators/coordinates_generator'
require_relative 'generators/number_generator'


class OpenWeather

  def current_weather_service
    CurrentDayService.new
  end

  def five_day_service
    FiveDayService.new
  end

  def current_day_service
    CurrentDayCoordinateService.new
  end

  def json_parse
    ParseJSON.new
  end

  def number_generator
    NumberGenerator.new
  end
  
end

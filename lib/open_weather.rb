require_relative 'services/current_day_service'
require_relative 'services/five_day_weather_service'
require_relative 'services/current_day_coordinate_service'

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
end

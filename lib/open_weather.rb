require_relative 'services/current_day_service'
require_relative 'services/five_day_service'
require_relative 'services/current_day_coordinate_service'

class OpenWeather

  def single_weather_service
    CurrentDayService.new
  end

  def five_day_service
    FiveDayService.new
  end

  def sixteen_day_service
    SixteenDayService.new
  end
end

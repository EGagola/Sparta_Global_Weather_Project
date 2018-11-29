require_relative 'services/single_current_day_service'
require_relative 'services/five_day_weather_service'
require_relative 'services/sixteen_day_weather_service'

class OpenWeather

  def current_weather_service
    CurrentDayService.new
  end

  def five_day_service
    FiveDayService.new
  end

  def sixteen_day_service
    SixteenDayService.new
  end
end

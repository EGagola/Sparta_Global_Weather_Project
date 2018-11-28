require_relative 'services/current_day_service'
require_relative 'services/5_day_service'
require_relative 'services/16_day_service'

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

require_relative 'services/single_current_day_service'
require_relative 'services/multiple_current_day_service'
require_relative 'services/five_day_weather_service'
require_relative 'services/sixteen_day_weather_service'

class OpenWeather

  def single_weather_service
    SingleCurrentDayService.new
  end

  def multiple_weather_service
    MultipleCurrentDayService.new
  end

  def five_day_service
    FiveDayService.new
  end

  def sixteen_day_service
    SixteenDayService.new
  end
end

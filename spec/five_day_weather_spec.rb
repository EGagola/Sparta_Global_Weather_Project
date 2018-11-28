describe FiveDayService do

  before(:all) do
    @api_key = ENV['OPENWEATHER_API_KEY']
    @five_day_service = OpenWeather.new.five_day_service
    @five_day_forecast = @five_day_service.get_five_day_data(@api_key)
  end

end

describe FiveDayService do

  attr_accessor :api_key

  before(:all) do
    @api_key = ENV['OPENWEATHERMAP_API_KEY']
    @five_day_service = OpenWeather.new.five_day_service
    @five_day_forecast = @five_day_service.get_five_day_data(@api_key)
  end

  it "should be a hash" do
    expect(@five_day_forecast).to be_kind_of Hash
  end
end

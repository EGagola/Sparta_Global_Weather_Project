

describe FiveDayService do

  attr_accessor :api_key

  before(:all) do
    @latitude = 45
    @longitude = 20
    @api_key = ENV['OPENWEATHERMAP_API_KEY']
    @five_day_forecast = JSON.parse(HTTParty::get("https://api.openweathermap.org/data/2.5/forecast?lat=#{@latitude}&lon=#{@longitude}&APPID=#{@api_key}").body)
  end


  it "should be a hash" do
    puts @five_day_forecast
    expect(@five_day_forecast).to be_kind_of Hash
  end
end

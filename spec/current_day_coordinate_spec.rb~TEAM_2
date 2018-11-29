describe CurrentDayCoordinateService do

  attr_accessor :api_key

  before(:all) do
    @api_key = ENV['OPENWEATHER_API_KEY']
    @current_day_service = OpenWeather.new.current_day_service
    @current_day_service.get_current_day_data(@api_key)
  end

  context "testing outer" do

    it "should return a hash" do
      expect(@current_day_service.get_current_day_data(@api_key)).to be_kind_of Hash
    end

  end

end

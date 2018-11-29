describe FiveDayService do

  attr_accessor :api_key

  before(:all) do
    @api_key = ENV['OPENWEATHERMAP_API_KEY']
    @five_day_service = OpenWeather.new.five_day_service
    @five_day_service.get_five_day_data(@api_key)
  end

  context "Testing outer section of FiveDayService" do
    it "should be a hash" do
      expect(@five_day_service.get_five_day_data(@api_key)).to be_kind_of Hash
    end

    it "should have a length of 5" do
      expect(@five_day_service.get_five_day_data(@api_key).length).to eq 5
    end

    it "should have a cod message of 200" do
      expect(@five_day_service.search_outer('cod').to_i).to eq 200
    end

    it "should have a message that is a float" do
      expect(@five_day_service.search_outer('message')).to be_kind_of Float
    end

    it "should have a list length that is equal to the count set" do
      expect(@five_day_service.search_outer('list').length).to eq(@five_day_service.search_outer('cnt'))
    end
  end

  context "Testing the weather array" do

    it "should contain a weather array" do
      expect(@five_day_service.search_list_for(30,'weather')).to be_kind_of Array
    end

    it "should contain 1 element in the weather array" do
      expect(@five_day_service.search_list_for(13,'weather').length).to eq 1
    end

    it "should have an integer id value in the weather array that is greater than 0" do
      expect(@five_day_service.search_weather_for(20,'id')).to be_kind_of Integer
      expect(@five_day_service.search_weather_for(20,'id')).to be > 0
    end

    it "should have a string value for main in the weather array that is less than 256 characters" do
      expect(@five_day_service.search_weather_for(9,'main')).to be_kind_of String
      expect(@five_day_service.search_weather_for(9,'main').length).to be < 256
    end

    it "should have a string value for the description" do
      expect(@five_day_service.search_weather_for(6,'description')).to be_kind_of String
    end

    it "should have a string value for the icon" do
      expect(@five_day_service.search_weather_for(16,'icon')).to be_kind_of String
    end
  end
end

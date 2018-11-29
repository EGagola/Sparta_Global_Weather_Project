describe CurrentDayCoordinateService do

  attr_accessor :api_key

  before(:all) do
    @api_key = ENV['OPENWEATHER_API_KEY']
    @current_day_service = OpenWeather.new.current_day_service
    @current_day_service.get_current_day_data(@api_key)
  end

  context "testing outer" do

    it "should return a hash of length 11" do
      expect(@current_day_service.get_current_day_data(@api_key)).to be_kind_of Hash
      expect(@current_day_service.get_current_day_data(@api_key).length).to eq 11
    end

    it "should have a cod integer that is 200" do
      expect(@current_day_service.search_outer('cod')).to be_kind_of Integer
      expect(@current_day_service.search_outer('cod')).to eq 200
    end

    it "should have a dt int value greater than 0" do
      expect(@current_day_service.search_outer('dt')).to be_kind_of Integer
      expect(@current_day_service.search_outer('dt')).to be > 0
    end

    it "should have an id value that is an integer and greater than 0" do
      expect(@current_day_service.search_outer('id')).to be_kind_of Integer
      expect(@current_day_service.search_outer('id')).to be > 0
    end

    it "should have a string value for name" do
      expect(@current_day_service.search_outer('name')).to be_kind_of String
    end

  end

  context "testing wind" do

    it "should be a Hash of length 2" do
      expect(@current_day_service.search_outer('wind')).to be_kind_of Hash
      expect(@current_day_service.search_outer('wind').length).to eq 2
    end

    it "should have a speeed element that is a positive float inside of wind" do
      expect(@current_day_service.search_input_for('wind','speed')).to be_kind_of Float
      expect(@current_day_service.search_input_for('wind','speed')).to be >= 0
    end

    it "should have a degree value in wind that is a float between 0 and 360" do
      expect(@current_day_service.search_input_for('wind','deg')).to be_kind_of Float
      expect(@current_day_service.search_input_for('wind','deg')).to be_between(0,360).inclusive
    end

  end

  context "testing clouds" do

    it "should be a Hash of length 1" do
      expect(@current_day_service.search_outer('clouds')).to be_kind_of Hash
      expect(@current_day_service.search_outer('clouds').length).to eq 1
    end

    it "should contain an all value that is an integer between 0 and 100" do
      expect(@current_day_service.search_input_for('clouds','all')).to be_kind_of Integer
      expect(@current_day_service.search_input_for('clouds','all')).to be_between(0,100).inclusive
    end

  end

  context "testing sys" do

    it "should be a Hash of length 4" do
      expect(@current_day_service.search_outer('sys')).to be_kind_of Hash
      expect(@current_day_service.search_outer('sys').length).to eq 4
    end

    it "should contain a float message" do
      expect(@current_day_service.search_input_for('sys','message')).to be_kind_of Float
    end

    it "should contain a string country" do
      expect(@current_day_service.search_input_for('sys','country')).to be_kind_of String
    end

    it "should contain an int value for sunrise that is greater than dt minus one day" do
      expect(@current_day_service.search_input_for('sys','sunrise')).to be_kind_of Integer
      expect(@current_day_service.search_input_for('sys','sunrise')).to be > (@current_day_service.search_outer('dt') - 86400)
    end

    it "should contain an int value for sunset that is greater than sunrise" do
      expect(@current_day_service.search_input_for('sys','sunset')).to be_kind_of Integer
      expect(@current_day_service.search_input_for('sys','sunset')). to be > (@current_day_service.search_input_for('sys','sunrise'))
    end

  end

  context 'testing coordinates' do

    it "should contain 2 entires" do
      expect(@current_day_service.search_outer('coord').length).to eq 2
    end

    it "shoud have a longitude value as float and between equal to the current longitude" do
      expect(@current_day_service.search_input_for('coord', 'lon')).to be_kind_of(Float).or be_kinf_of(Integer)
      expect(@current_day_service.search_input_for('coord', 'lon')).to eq(@current_day_service.longitude)
    end

    it "shoud have a longitude value as float and between equal to the current longitude" do
      expect(@current_day_service.search_input_for('coord', 'lat')).to be_kind_of(Float).or be_kind_of(Integer)
      expect(@current_day_service.search_input_for('coord', 'lat')).to eq(@current_day_service.latitude)
    end

  end

  context 'testing weather' do

    it "should be an array containing one hash" do
      expect(@current_day_service.search_outer('weather')).to be_kind_of(Array)
      expect(@current_day_service.search_outer('weather').length).to eq 1
      expect(@current_day_service.search_outer('weather')[0]).to be_kind_of(Hash)
    end

    it "should have an id value in integer format and be 3 characters long" do
      expect(@current_day_service.search_weather_for('id')).to be_kind_of(Integer)
      # id values can never begin with zeros (so .to_s can be used). Refer to: https://openweathermap.org/weather-conditions
      expect(@current_day_service.search_weather_for('id').to_s.length).to eq 3
    end

    it "should have a main value in string format and below 255 characters" do
      expect(@current_day_service.search_weather_for('main')).to be_kind_of(String)
      expect(@current_day_service.search_weather_for('main').length).to be < 255
    end

    it "should have a description value in string format" do
      expect(@current_day_service.search_weather_for('description')).to be_kind_of(String)
    end

    it "should have an icon value in string format and be 3 characters long" do
      expect(@current_day_service.search_weather_for('icon')).to be_kind_of(String)
      expect(@current_day_service.search_weather_for('icon').length).to eq 3
    end

  end

end

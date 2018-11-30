describe CurrentDayCoordinateService do

  attr_accessor :api_key

  before(:all) do
    @api_key = ENV['OPENWEATHER_API_KEY']
    @current_day_service = OpenWeather.new.current_day_service
    @current_day_service.get_current_day_data(@api_key)
  end

  context "testing outer" do

    it "should return a hash of length 11-13" do
      expect(@current_day_service.get_current_day_data(@api_key)).to be_kind_of Hash
      expect(@current_day_service.get_current_day_data(@api_key).length).to be_between(11,13).inclusive
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

    it "should have a base value in string format" do
      expect(@current_day_service.search_outer('base')).to be_kind_of String
    end

  end

  context "testing wind" do

    it "should be a Hash of length 1-3" do
      expect(@current_day_service.search_outer('wind')).to be_kind_of Hash
      expect(@current_day_service.search_outer('wind').length).to be_between(1,3).inclusive
    end

    it "should have a speeed element that is a positive number inside of wind" do
      expect(@current_day_service.search_input_for('wind','speed')).to be_kind_of(Float).or be_kind_of(Integer).or be(nil)
      expect(@current_day_service.search_input_for('wind','speed')).to be(nil).or be >= 0
    end

    it "should have a degree value in wind that is a number between 0 and 360" do
      expect(@current_day_service.search_input_for('wind','deg')).to be_kind_of(Float).or be_kind_of(Integer).or be(nil)
      expect(@current_day_service.search_input_for('wind','deg')).to be(nil).or be_between(0,360).inclusive
    end

  end

  context 'testing rain if it appears' do

    it "should be a number between 0 and 100" do
      if (@current_day_service.search_outer('rain') != nil and @current_day_service.search_outer('rain') != {})
        expect(@current_day_service.search_outer('rain').length).to eq 1
      end
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

    it "should be a Hash of length 3-6" do
      expect(@current_day_service.search_outer('sys')).to be_kind_of Hash
      expect(@current_day_service.search_outer('sys').length).to be_between(3,6).inclusive
    end

    it "should contain a numerical message" do
      expect(@current_day_service.search_input_for('sys','message')).to be_kind_of(Float).or be_kind_of(Integer)
    end

    it "should contain a string country or be nil" do
      expect(@current_day_service.search_input_for('sys','country')).to be_kind_of(String).or be(nil)
    end

    it "should contain an int value for sunrise that is greater than dt minus two days or be 0" do
      expect(@current_day_service.search_input_for('sys','sunrise')).to be_kind_of Integer
      expect(@current_day_service.search_input_for('sys','sunrise')).to  eq(0).or be > (@current_day_service.search_outer('dt') - (2*86400))
    end

    it "should contain an int value for sunset that is greater than sunrise or 0" do
      expect(@current_day_service.search_input_for('sys','sunset')).to be_kind_of Integer
      expect(@current_day_service.search_input_for('sys','sunset')). to eq(0).or be > (@current_day_service.search_input_for('sys','sunrise'))
    end

  end

  context 'testing coordinates' do

    it "should contain 2 entries" do
      expect(@current_day_service.search_outer('coord').length).to eq 2
    end

    it "shoud have a longitude value as float and between equal to the current longitude" do
      expect(@current_day_service.search_input_for('coord', 'lon')).to be_kind_of(Float).or be_kind_of(Integer)
      expect(@current_day_service.search_input_for('coord', 'lon')).to be_between((@current_day_service.longitude - 0.1), (@current_day_service.longitude + 0.1)).inclusive
    end

    it "shoud have a latitude value as float and between equal to the current latitude" do
      expect(@current_day_service.search_input_for('coord', 'lat')).to be_kind_of(Float).or be_kind_of(Integer)
      expect(@current_day_service.search_input_for('coord', 'lat')).to be_between((@current_day_service.latitude - 0.1), (@current_day_service.latitude + 0.1)).inclusive
    end

  end

  context 'testing weather' do

    it "should be an array containing at least one hash" do
      expect(@current_day_service.search_outer('weather')).to be_kind_of(Array)
      expect(@current_day_service.search_outer('weather').length).to be >= 1
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

  context 'testing main' do

    it "should have a length of between 5 and 7" do
      expect(@current_day_service.search_outer('main').length).to be_between(5, 7).inclusive
    end

    it "should have a temperature value between 173 and 373" do
      expect(@current_day_service.search_input_for('main', 'temp')).to be_between(173, 373).inclusive
    end

    it "should have a pressure value which is numeric" do
      expect(@current_day_service.search_input_for('main', 'pressure')).to be_kind_of(Integer).or be_kind_of(Float)
    end

    it "should have a humidity value which is between 0 and 100 and be integer" do
      expect(@current_day_service.search_input_for('main', 'humidity')).to be_kind_of(Integer)
      expect(@current_day_service.search_input_for('main', 'humidity')).to be_between(0,100).inclusive
    end

    it "should have a temperature min value between 173 and 373" do
      expect(@current_day_service.search_input_for('main', 'temp_min')).to be_between(173, 373).inclusive
    end

    it "should have a temperature max value between 173 and 373" do
      expect(@current_day_service.search_input_for('main', 'temp_max')).to be_between(173, 373).inclusive
    end

    it "should have a temperature max value between 173 and 373" do
      expect(@current_day_service.search_input_for('main', 'temp_max')).to be_between(173, 373).inclusive
    end

    it "should have a sea level value that is numeric" do
      if (@current_day_service.search_outer('main').length > 5)
        expect(@current_day_service.search_input_for('main', 'sea_level')).to be_kind_of(Float).or be_kind_of(Integer)
      end
    end

    it "should have a ground level value that is numeric" do
      if (@current_day_service.search_outer('main').length > 5)
        expect(@current_day_service.search_input_for('main', 'grnd_level')).to be_kind_of(Float).or be_kind_of(Integer)
      end
    end

  end

end

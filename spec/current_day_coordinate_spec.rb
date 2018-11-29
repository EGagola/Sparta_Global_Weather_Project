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

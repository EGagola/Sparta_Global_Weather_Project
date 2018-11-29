describe FiveDayService do

  attr_accessor :api_key

  before(:all) do
    @api_key = ENV['OPENWEATHER_API_KEY']
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

    it "should contain 1 Hash element in the weather array" do
      expect(@five_day_service.search_list_for(13,'weather').length).to eq 1
      expect(@five_day_service.search_list_for(30,'weather')[0]).to be_kind_of Hash
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

  context 'Testing main inside list' do

    it "should contain 8 items" do
      expect(@five_day_service.search_list_for(0, 'main').length).to eq 8
      expect(@five_day_service.search_list_for(10, 'main').length).to eq 8
    end

    it "should be in hash format" do
      expect(@five_day_service.search_list_for(4, 'main')).to be_kind_of(Hash)
      expect(@five_day_service.search_list_for(22, 'main')).to be_kind_of(Hash)
    end

    it "should have a temperature value in a reasonable range" do
      expect(@five_day_service.search_list_input_for(16, 'main', 'temp')).to be_between(173, 373).inclusive
      expect(@five_day_service.search_list_input_for(32, 'main', 'temp')).to be_between(173, 373).inclusive
    end

    it "should have a temperature min value in a reasonable range" do
      expect(@five_day_service.search_list_input_for(9, 'main', 'temp_min')).to be_between(173, 373).inclusive
      expect(@five_day_service.search_list_input_for(37, 'main', 'temp_min')).to be_between(173, 373).inclusive
    end

    it "should have a temperature max value in a reasonable range" do
      expect(@five_day_service.search_list_input_for(13, 'main', 'temp_max')).to be_between(173, 373).inclusive
      expect(@five_day_service.search_list_input_for(23, 'main', 'temp_max')).to be_between(173, 373).inclusive
    end

    it "should have a pressure value in float format" do
      expect(@five_day_service.search_list_input_for(3, 'main', 'pressure')).to be_kind_of(Float)
      expect(@five_day_service.search_list_input_for(33, 'main', 'pressure')).to be_kind_of(Float)
    end

    it "should have a sea level value in float format" do
      expect(@five_day_service.search_list_input_for(3, 'main', 'sea_level')).to be_kind_of(Float)
      expect(@five_day_service.search_list_input_for(33, 'main', 'sea_level')).to be_kind_of(Float)
    end

    it "should have a ground level value in float format" do
      expect(@five_day_service.search_list_input_for(3, 'main', 'grnd_level')).to be_kind_of(Float)
      expect(@five_day_service.search_list_input_for(33, 'main', 'grnd_level')).to be_kind_of(Float)
    end

    it "should have a humidity value in integer format and between 1 and 100" do
      expect(@five_day_service.search_list_input_for(18, 'main', 'humidity')).to be_kind_of(Integer)
      expect(@five_day_service.search_list_input_for(18, 'main', 'humidity')).to be_between(0,100).inclusive
      expect(@five_day_service.search_list_input_for(39, 'main', 'humidity')).to be_kind_of(Integer)
      expect(@five_day_service.search_list_input_for(39, 'main', 'humidity')).to be_between(0,100).inclusive
    end

    it "should have a temp_kf value in integer format" do
      expect(@five_day_service.search_list_input_for(21, 'main', 'temp_kf')).to be_kind_of(Integer)
      expect(@five_day_service.search_list_input_for(27, 'main', 'temp_kf')).to be_kind_of(Integer)
    end
  end

  context 'Testing sys inside the list' do

    it "should be in a hash format with 1 element" do
      expect(@five_day_service.search_list_for(1,'sys')).to be_kind_of(Hash)
      expect(@five_day_service.search_list_for(14, 'sys').length).to eq 1
    end

    it "should have a pod value as a string" do
      expect(@five_day_service.search_list_input_for(39, 'sys', 'pod')).to be_kind_of(String)
    end
  end

  context 'Testing clouds inside list' do

    it "should have a clouds hash of length 1 in list" do
      expect(@five_day_service.search_list_for(12,'clouds')).to be_kind_of Hash
      expect(@five_day_service.search_list_for(12,'clouds').length).to eq 1
    end

    it "should have an integer value for all in clouds that is between 0 and 100" do
      expect(@five_day_service.search_list_input_for(38,'clouds','all')).to be_kind_of Integer
      expect(@five_day_service.search_list_input_for(38,'clouds','all')).to be_between(0,100).inclusive
    end
  end

  context 'Testing rain inside list' do

    it 'should return as a hash' do
      if @five_day_service.search_list_for(2,'rain')!= nil
        expect(@five_day_service.search_list_for(2,'rain')).to be_kind_of(Hash)
      end
    end

    it 'should return key as string if rain it is not empty' do
      if (@five_day_service.search_list_for(30,'rain') != nil) && (@five_day_service.search_list_for(30,'rain') != {})
        expect(@five_day_service.search_list_for(30, 'rain').keys[0]).to be_kind_of(String)
      end
    end

    it 'should return value as a float greater than zero if rain it is not empty' do
      if (@five_day_service.search_list_for(30,'rain') != nil) && (@five_day_service.search_list_for(30,'rain') != {})
        expect(@five_day_service.search_list_for(30, 'rain')["3h"]).to be_kind_of(Float)
        expect(@five_day_service.search_list_for(30, 'rain')["3h"]).to be >= 0
      end
    end
  end

    context 'testing time, rain and wind values inside of list' do

    it "should have a wind data in a hash" do
      expect(@five_day_service.search_list_for(3, 'wind')).to be_kind_of Hash
    end

    it "should have a wind hash of length 2" do
      expect(@five_day_service.search_list_for(13, 'wind').length).to eq 2
    end

    it "should have a wind speed as a float" do
      expect(@five_day_service.search_list_input_for(13, "wind", "speed")).to be_kind_of Float
    end

    it "should have a wind degree as a float " do
      expect(@five_day_service.search_list_input_for(13, "wind", "speed")).to be_kind_of(Float).or be_kind_of(Integer)
    end

    it "should have a wind degree between 0 and 360" do
      expect(@five_day_service.search_list_input_for(13, "wind", "deg")).to be_between(0,360).inclusive
    end

    it "delta time should be an Integer" do
      expect(@five_day_service.search_list_for(23, 'dt')).to be_kind_of Integer
    end

    it "should have data within a 5 day timescale" do
      expect(@five_day_service.search_list_for(39, 'dt') - 421200).to eq (@five_day_service.search_list_for(0, 'dt'))
    end

    it "should have delta time text in the correct format" do
      expect(@five_day_service.dt_txt_formatter(@five_day_service)).to eq 4
      #expecting 4 true values
    end

    it "should have delta time equal to the delta time text" do
      expect(@five_day_service.delta_text_check(@five_day_service)).to eq true
    end

    it "should have test intervals of three hours" do
      expect(@five_day_service.search_list_for(1, 'dt') - 10800).to eq (@five_day_service.search_list_for(0, 'dt'))
      expect(@five_day_service.search_list_for(6, 'dt') - 10800).to eq (@five_day_service.search_list_for(5, 'dt'))
      expect(@five_day_service.search_list_for(39, 'dt') - 10800).to eq (@five_day_service.search_list_for(38, 'dt'))
    end
  end
end

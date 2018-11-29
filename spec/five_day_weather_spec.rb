describe FiveDayService do

  attr_accessor :api_key

  before(:all) do
    @api_key = ENV['OPENWEATHER_API_KEY']
    @five_day_service = OpenWeather.new.five_day_service
    @five_day_service.get_five_day_data(@api_key)
  end

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

  context 'testing main inside list' do

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

end

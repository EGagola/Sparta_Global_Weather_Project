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
end

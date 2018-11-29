describe OpenWeather do

  before(:all) do
    @current_day_service = CurrentDayService.new
  end

  it 'should have a result Hash'do
    expect(@current_day_service.get_result).to be_kind_of Hash
  end
  it 'should check is Longitude is a float' do
    expect(@current_day_service.get_latitude).to be_kind_of Float
  end
  it 'should check is Latitude is a float' do
    expect(@current_day_service.get_longitude).to be_kind_of Float
  end
  it 'should return longitute between the range of 0 to 181' do
    expect(@current_day_service.get_longitude).to be_between(0,181).inclusive
  end
  it 'should return Latitude between the range of 0 to 181' do
    expect(@current_day_service.get_latitude).to be_between(0,181).inclusive
  end
  it 'should return an Integer for Weather Id' do
    expect(@current_day_service.get_id).to be_kind_of Integer
  end
  it 'the weather should have 4 keys'do
    expect(@current_day_service.weather_key_value).to eq 4
  end
  it 'should be a string in Description'do
    expect(@current_day_service.get_description).to be_kind_of String
  end
  it 'should have icon in weather to be a string'do
    expect(@current_day_service.get_weather).to be_kind_of String
  end
  it 'should have the base as a string'do
    expect(@current_day_service.get_base_as_string).to be_kind_of String
  end
  it 'should check the visibility is a integer'do
    expect(@current_day_service.get_visibility_is_an_integer).to be_kind_of Integer
  end
  it 'should check sys has id as a float 'do
    expect(@current_day_service.system_id_value).to be_kind_of Float
  end
  it 'should check system has 6 keys'do
    expect(@current_day_service.sys_has_6_keys).to eq 6
  end
  it 'clouds all return integer'do
    expect(@current_day_service.get_clouds_integer).to be_kind_of Integer
  end
  it 'check all keys return string'do
    expect(@current_day_service.get_keys_return_string).to be_kind_of String
  end
  it 'base should have stations as a string'do
    expect(@current_day_service.get_base_station_string).to be_kind_of String
  end
  it 'should return float as visibility'do
    expect(@current_day_service.get_float_visibility).to be_kind_of String
  end
  it 'should return float as visibility'do
    expect(@current_day_service.get_float_visibility).to be_kind_of String
  end

  it "testing" do
    puts @current_day_service.test
  end
end

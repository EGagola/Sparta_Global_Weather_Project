describe CurrentDayService do

  before(:all) do
    @current_day_service = OpenWeather.new.current_day_service
    @current_day_service.get_single_id('2643743')
  end

  it 'should have a result Hash'do
    expect(@current_day_service.get_result_hash).to be_kind_of Hash
  pending
  end
  it 'should check is Longitude is a float' do
    expect(@current_day_service.get_latitude).to be_kind_of Float
    pending
  end
  it 'should check is Latitude is a float' do
    expect(@current_day_service.get_longitude).to be_kind_of Float
    pending
  end
  it 'should return longitute between the range of 0 to 181' do
    expect(@current_day_service.get_longitude_between_0_to_181).to be_between(0,181).inclusive
    pending
  end
  it 'should return Latitude between the range of 0 to 181' do
    expect(@current_day_service.get_latitude_between_0_to_181).to be_between(0,181).inclusive
    pending
  end
  it 'should return an Integer for Weather Id' do
    expect(@current_day_service.get_id).to be_kind_of Numeric
    pending
  end
  it 'the weather should have 4 keys'do
    expect(@current_day_service.get_weather_has_4_keys).to eq 4
    pending
  end
  it 'should be a string in Description'do
    expect(@current_day_service.get_description).to be_kind_of String
    pending
  end
  it 'should have icon in weather to be a string'do
    expect(@current_day_service.get_weather).to be_kind_of String
    pending
  end
  it 'should have the base as a string'do
    expect(@current_day_service.get_base).to be_kind_of String
    pending
  end
  it 'should check the visibility is a integer'do
    expect(@current_day_service.get_visibility).to be_kind_of Integer
    pending
  end
  it 'should check sys has id as a float 'do
    expect(@current_day_service.get_system_id).to be_kind_of Float
    pending
  end
  it 'should check system has 6 keys'do
    expect(@current_day_service.sys_has_6_keys).to eq 6
    pending
  end
  it 'clouds all return integer'do
    expect(@current_day_service.get_clouds).to be_kind_of Integer
    pending
  end
  it 'check all keys return string'do
    expect(@current_day_service.get_keys_return).to be_kind_of String
    pending
  end
  it 'base should have stations as a string'do
    expect(@current_day_service.get_base_station).to be_kind_of String
    pending
  end
  it 'should return float as visibility'do
    expect(@current_day_service.get_visibility).to be_kind_of String
    pending
  end
  it 'should check longitute to be between -90 to 90'do
    expect(@current_day_service.get_between_longitude).to be_between(-90,90).inclusive
    pending
  end
  it 'should check latitude to be between -180 to 180'do
    expect(@current_day_service.get_between_latitude).to be_between(-180,180).inclusive
    pending
  end
  it 'check humidity should be between 30 to 50 percent'do
    expect(@current_day_service.get_humidity).to be_between(30,50).inclusive
    pending
  end
  it 'check id to be length 7'do
    expect(@current_day_service.get_id.length).to eq 7
    pending
  end
  it 'should check longitute to be between -90 to 90'do
    expect(@current_day_service.get_between_longitude).to be_between(-90,90).inclusive
    pending
  end
end

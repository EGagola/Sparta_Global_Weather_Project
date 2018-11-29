describe SingleCurrentDayService do

  before(:all) do
    @api_key = ENV['FIXER_API_KEY']
    @single_weather_service = ParseJson.new(HTTParty::get("api.openweathermap.org/data/2.5/group?id=#{@api_key}").body)

    @single_weather_service = OpenWeather.new.single_weather_service
    @single_weather_service.get_single_weather_id('2332453')
  end


  it 'should have a result Hash'do
    expect(@single_weather_service.get_test).to be_kind_of Hash

  end
  it 'should check that Longitude is a float' do
    expect(@single_weather_service.get_longitude_value.to_i).to be_kind_of Float
  end
  # it 'should check is Latitude is a float' do
  #   expect(@single_weather_service.get_longitude_value).to be_kind_of Float
  #   pending
  # end
  # it 'should return longitude between the range of 0 to 181' do
  #   expect(@single_weather_service.get_longitude_value.length).to be_between(0,181).inclusive
  #   pending
  # end
  # it 'should return Latitude between the range of 0 to 181' do
  #   expect(@single_weather_service.get_latitude_value.length).to be_between(0,181).inclusive
  #   pending
  # end
  # it 'should return an Integer for Weather Id' do
  #   expect(@single_weather_service.get_weather_value).to be_kind_of Numeric
  #   pending
  # end
  # it 'the weather should have 4 keys'do
  #   expect(@single_weather_service.get_weather_value).to eq 4
  #   pending
  # end
  # it 'should be a string in Description'do
  #   expect(@single_weather_service.get_description_value).to be_kind_of String
  #   pending
  # end
  # it 'should have icon in weather to be a string'do
  #   expect(@single_weather_service.get_weather_value).to be_kind_of String
  #   pending
  # end
  # it 'should have the base as a string'do
  #   expect(@single_weather_service.get_base_as_string).to be_kind_of String
  #   pending
  # end
  # it 'should check the visibility is a integer'do
  #   expect(@single_weather_service.get_visibility_is_an_integer).to be_kind_of Integer
  #   pending
  # end
  # it 'should check sys has id as a float 'do
  #   expect(@single_weather_service.system_id_value).to be_kind_of Float
  #   pending
  # end
  # it 'should check system has 6 keys'do
  #   expect(@single_weather_service.sys_has_6_keys).to eq 6
  #   pending
  # end
  # it 'clouds all return integer'do
  #   expect(@single_weather_service.get_clouds_integer).to be_kind_of Integer
  #   pending
  # end
  # it 'check all keys return string'do
  #   expect(@single_weather_service.get_keys_return_string).to be_kind_of String
  #   pending
  # end
  # it 'base should have stations as a string'do
  #   expect(@single_weather_service.get_base_station_string).to be_kind_of String
  #   pending
  # end
  # it 'should return float as visibility'do
  #   expect(@single_weather_service.get_float_visibility).to be_kind_of String
  #   pending
  # end
  # it 'should return float as visibility'do
  #   expect(@single_weather_service.get_float_visibility).to be_kind_of String
  #   pending
  # end
end

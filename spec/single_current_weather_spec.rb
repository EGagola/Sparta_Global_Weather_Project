require_relative '../lib/generators/id_generator'

describe OpenWeather do

  attr_accessor :api_key

  before(:all) do
    @api_key = ENV['OPENWEATHER_API_KEY']
    @cityid = CityIdGenerator.new.single_generator
    @single_weather_service = OpenWeather.new.single_weather_service
    @single_weather_service.get_single_weather_id(@cityid, @api_key)
    @current_day = CurrentDayService.new
  end


  it 'should have a result Hash' do
    expect(@single_weather_service.get_result).to be_kind_of(Hash)
   end

  it 'check clouds id to be length 7'do
    expect(@single_weather_service.get_id.length).to eq 7
  end

  it 'should check Latitude is a float' do
    expect(@single_weather_service.get_latitude_value).to be_kind_of Float
  end

  it 'should check that Longitude is a float' do
    expect(@single_weather_service.get_longitude_value).to be_kind_of Float
  end

  it 'should return an Integer for Weather Id' do
    expect(@single_weather_service.get_weather_id).to be_kind_of Numeric
  end

  it 'should Weather Id of 3 integer' do
    expect(@single_weather_service.get_weather_id_count.length).to eq 3
  end

  it 'the weather should have 4 keys'do
    expect(@single_weather_service.get_weather_length).to eq 4
  end

  it 'should return string weather condition between 3-20'do
    expect(@single_weather_service.get_description_value_count.length).to be_between(3,20).inclusive
  end

  it 'should be a string in Description'do
    expect(@single_weather_service.get_description_value).to be_kind_of String
  end
  it 'should have icon in weather to be a string'do
    expect(@single_weather_service.get_icon_value).to be_kind_of String
  end
end

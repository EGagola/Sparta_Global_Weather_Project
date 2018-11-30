require_relative '../lib/generators/id_generator'

describe OpenWeather do

  attr_accessor :api_key

  before(:all) do
    @api_key = ENV['OPENWEATHER_API_KEY']
    @cityid = CityIdGenerator.new.single_generator
    @single_weather_service = OpenWeather.new.single_weather_service
    @single_weather_service.get_single_weather_id(@cityid, @api_key)
  end


  it 'should have a result Hash' do
    expect(@single_weather_service.get_result).to be_kind_of(Hash)
   end

  it 'check clouds id to be length 7'do
    expect(@single_weather_service.get_id.length).to eq 7
  end

  it 'should check Latitude is a float' do
    expect(@single_weather_service.get_latitude_value).to be_kind_of(Float).or be_kind_of(Integer)
  end

  it 'should check that Longitude is a float' do
    expect(@single_weather_service.get_longitude_value).to be_kind_of(Float).or be_kind_of(Integer)
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

  it 'should return string weather condition between 3-40'do
    expect(@single_weather_service.get_description_value_count.length).to be_between(3,40).inclusive
  end

  it 'should be a string in Description'do
    expect(@single_weather_service.get_description_value).to be_kind_of String
  end
  it 'should have icon in weather to be a string'do
    expect(@single_weather_service.get_icon_value).to be_kind_of String
  end
  
  it 'should have a result Hash' do
    expect(@single_weather_service.get_result).to be_kind_of(Hash)
   end
 
  it "should return temperature of float" do
    expect(@single_weather_service.get_temperature).to be_kind_of Float
  end
 
  it "should return a code of 200 status" do
    expect(@single_weather_service.get_status_code).to eq 200
  end
 
  it "should return a pressure of float" do
    expect(@single_weather_service.get_pressure).to be_kind_of Float
  end
 
  it "should return a humidity of integer " do
    expect(@single_weather_service.get_humidity).to be_kind_of Integer
  end
 
  it "should return a temp min of float " do
    expect(@single_weather_service.get_temperature_minimum).to be_kind_of Float
  end
 
  it "should return a temp max of float" do
    expect(@single_weather_service.get_temperature_maximum).to be_kind_of Float
  end
 
  it 'should check the visibility is a integer'do
    expect(@single_weather_service.get_visibility).to be_kind_of Integer
  end
 
  it "should return a wind of hash" do
    expect(@single_weather_service.get_wind).to be_kind_of Hash
  end
 
  it "should return wind speed of float time" do
    expect(@single_weather_service.get_wind_speed).to be_kind_of Float
  end
 
  it "should return a cloud of hash" do
    expect(@single_weather_service.get_cloud).to be_kind_of Hash
  end
 
  it "should return all clouds of float" do
    expect(@single_weather_service.get_all_clouds).to be_kind_of Float
  end
 
  it "should return a dt of float" do
    expect(@single_weather_service.get_dt).to be_kind_of Float
  end
 
  it "should return a system of hash" do
    expect(@single_weather_service.get_system).to be_kind_of Hash
  end
end

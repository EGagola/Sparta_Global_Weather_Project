require_relative '../lib/generators/id_generator'

describe OpenWeather do

  attr_accessor :api_key

  before(:all) do
    @api_key =
    @single_weather_service = OpenWeather.new.single_weather_service
    @single_weather_service.get_single_weather_id(@api_key)
    @current_day = CurrentDayService.new
  end

  it 'should have a result Hash' do
    expect(@single_weather_service.get_result).to be_kind_of(Hash)
   end

  it 'check id to be length 7'do
    expect(@single_weather_service.get_id.length).to eq 7
  end

  it 'should check Latitude is a float' do
    expect(@single_weather_service.get_latitude_value).to be_kind_of(Float)
  end

  it 'should check that Longitude is a float' do
    expect(@single_weather_service.get_longitude_value).to be_kind_of(Float)
  end

  it 'should return an Integer for Weather Id' do
    expect(@single_weather_service.get_id).to be_kind_of(Numeric)
  end

  it 'should Weather Id of 3 integer' do
    expect(@single_weather_service.get_id.length).to eq 3
  end

  it 'the weather should have 4 keys'do
    expect(@single_weather_service.get_weather_has_4_keys).to eq 4
  end

  it 'should return string weather condition between 3-20'do
    expect(@single_weather_service.get_weather_has_4_keys.length).to be_between(3,20).inclusive
  end

  it 'should be a string in Description'do
    expect(@single_weather_service.get_description).to be_kind_of(String)
  end
  it 'should have icon in weather to be a string'do
    expect(@single_weather_service.get_weather).to be_kind_of(String)
  end
  it 'should have the base as a string'do
    expect(@single_weather_service.get_base).to be_kind_of(String)
  end

  it "should return weather base strings between 8-15" do
    expect(@single_weather_service.get_weather).to be_between(8,15).inclusive
  end

  it "should return hash for main" do
    expect(@single_weather_service.get_result_hash).to be_kind_of Hash
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

  it "should return a wind degree of float" do
    pending
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

  it 'should check sys has id as a float 'do
    expect(@single_weather_service.get_system_id).to be_kind_of Float
  end

  it 'should check system has 6 keys'do
    expect(@single_weather_service.sys_has_6_keys).to eq 6
  end
  it 'clouds all return integer'do
    expect(@single_weather_service.get_clouds).to be_kind_of Integer
  end
  it 'check all keys return string'do
    expect(@single_weather_service.get_keys_return).to be_kind_of String
  end
  it 'base should have stations as a string'do
    expect(@single_weather_service.get_base_station).to be_kind_of String
  end
  it 'should return float as visibility'do
    expect(@single_weather_service.get_visibility).to be_kind_of String
  end
  it 'should check longitute to be between -90 to 90'do
    expect(@single_weather_service.get_between_longitude).to be_between(-90,90).inclusive
  end
  it 'should check latitude to be between -180 to 180'do
    expect(@csingle_weather_service.get_between_latitude).to be_between(-180,180).inclusive
  end
  it 'check humidity should be between 30 to 50 percent'do
    expect(@single_weather_service.get_humidity).to be_between(30,50).inclusive
  end
end

require_relative '../lib/generators/id_generator'

describe OpenWeather do

  attr_accessor :api_key

  before(:all) do
    @api_key = ENV['OPENWEATHER_API_KEY']
    @single_weather_service = OpenWeather.new.single_weather_service
    @single_weather_service.get_single_weather_id(@api_key)
    @current_day = CurrentDayService.new
  end

  it 'should have the base as a string'do
    expect(@single_weather_service.get_base_value).to be_kind_of(String)
  end

  it "should return weather base strings between 8-15" do
    expect(@single_weather_service.get_weather_value).to be_between(8,15).inclusive
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
end

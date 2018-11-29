require 'httparty'
require 'json'

class CityIdGenerator
  include HTTParty

  base_uri 'https://samples.openweathermap.org'


  def initialize
  end

  def weather
    JSON.parse(self.class.get("/data/2.5/weather?id=2172797&APPID=a210fbef76875d625711834647e06f34").body)
  end



end

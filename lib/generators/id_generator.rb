require 'httparty'
require 'json'

class CityIdGenerator
  include HTTParty

  base_uri 'https://samples.openweathermap.org'


  def initialize
  end

  def weather
    JSON.parse(self.class.get("/data/2.5/weather?id=2172797&appid=b6907d289e10d714a6e88b30761fae22").body)
  end


end

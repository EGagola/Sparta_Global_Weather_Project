require 'httparty'
require 'json'

class FiveDayService
  include HTTParty


  def initialize
    @longitude = 20
    @latitude = 30
  end


  def get_five_day_data(api_key)
    @five_day_service = JSON.parse(self.class.get("http://api.openweathermap.org/data/2.5/forecast?lat=#{@latitude}&lon=#{@longitude}&APPID=#{api_key}").body)
  end

  def get_list
    @five_day_service['list']
    
  end
end

# require 'httparty'
# require 'json'
#
# class CityIdGenerator
#   include HTTParty
#
#   base_uri 'api.openweathermap.org'
#
#   def weather(cityID)
#     JSON.parse(self.class.get("/data/2.5/group?id=#{cityID}&APPID=a210fbef76875d625711834647e06f34").body)
#   end
#
#
#
# end

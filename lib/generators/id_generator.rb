require 'httparty'
require 'json'

class CityIdGenerator
#   include HTTParty

#   base_uri 'api.openweathermap.org'

#   def weather(cityID)
#     JSON.parse(self.class.get("/data/2.5/group?id=#{cityID}&APPID=a210fbef76875d625711834647e06f34").body)
#   end

# end

    attr_accessor :id_data

    def initialize
        @city_data = JSON.parse(File.read('city_list.json'))
        @single_generator
    end 

    def single_generator
    id_array = []

        city_data.each do |city|
            id_array << city['id']
        end 

        id_array
    end

  
end

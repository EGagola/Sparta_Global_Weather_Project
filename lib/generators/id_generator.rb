require 'httparty'
require 'json'

class CityIdGenerator

    attr_accessor :id_data

    def initialize
        @city_data = JSON.parse(File.read('city_list.json'))
        @single_generator
    end 

    def single_generator
        id_array = []

        @city_data.each do |city|
            id_array << city['id']
        end 

        id_array.sample
    end
  
end

id = CityIdGenerator.new
p id.single_generator
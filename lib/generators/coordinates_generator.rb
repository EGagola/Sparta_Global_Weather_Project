require 'json'

class ParseJSON

  attr_accessor :json_file

  def initialize
    @json_file = JSON.parse(File.read('city.list.json'))
  end

  def get_json_length
    @json_file.length
  end

  def generate_random_number
    (rand * @json_file.length).floor
  end

  def get_coord number , direction
    @json_file[number]['coord']["#{direction}"]
  end

end

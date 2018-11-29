require 'json'

class ParseJSON

  attr_accessor :json_file

  def initialize json_file
    @json_file = JSON.parse(File.read(json_file))
  end

  def get_input number , input
    puts @json_file[number]["#{input}"]
  end

  def get_coord number , direction
    @json_file[number]['coord']["#{direction}"]
  end

end
#
# newt = ParseJSON.new('../../city.list.json')
# puts newt.get_coord(100,'lon')
# puts newt.get_coord(100,'lat')

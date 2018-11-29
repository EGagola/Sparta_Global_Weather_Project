require 'httparty'
require 'json'

class CurrentDayService
  include HTTParty

  base_uri 'https://samples.openweathermap.org'

end

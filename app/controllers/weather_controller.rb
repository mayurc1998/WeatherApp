class WeatherController < ApplicationController

  def getWeather
    city=params[:city]
    require "uri"
    require "net/http"
    url = URI("https://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=2e4e91856ff3757822586cb2abd97221")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    @response=response.read_body
    redirect_to root_path(weather:@response)
  end
end

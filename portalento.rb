require 'sinatra'
require 'net/http'
require 'json'

get '/' do
  response = Net::HTTP.get( URI.parse( "http://freegeoip.net/json/#{request.ip}" ) )
  country_code = JSON.parse( response )["country_code"]

  if (country_code.downcase == "pt")
    redirect to "/pt"
  else
    redirect to "/en"
  end
end

get '/en' do
  File.read(File.join('public', 'index.html'))
end

get '/pt' do
  File.read(File.join('public', 'index-pt.html'))
end


require 'sinatra'
require 'net/http'
require 'json'
require 'haml'
require 'i18n'
require 'i18n/backend/fallbacks'

configure do
  # Translations
  I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
  I18n.load_path = Dir[File.join(settings.root, 'locales', '*.yml')]
  I18n.backend.load_translations
end

get '/' do
  response = Net::HTTP.get( URI.parse( "http://freegeoip.net/json/#{request.ip}" ) )
  country_code = JSON.parse( response )["country_code"]

  if (country_code.downcase == "pt")
    redirect to "/pt"
  else
    redirect to "/en"
  end
end

get '/:locale' do
  I18n.locale = params[:locale]
  haml :index
end

get '/:locale/faq' do
  I18n.locale = params[:locale]
  haml :faq
end

require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/listing_repository'
require_relative './lib/database_connection'

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = ListingRepository.new
    @listings = repo.all
    return erb(:index)
  end

  get '/listing/:id' do
    return erb(:listing)
  end
end




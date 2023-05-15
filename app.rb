require 'sinatra/base'
require 'sinatra/reloader'


DatabaseConnection.connect('makersbnb_test')
class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end



  get '/' do
    return erb(:index)
  end

  get '/listing/:id' do
    repo = ListingRepository.new
    @listing = repo.find(params[:id])
  
    return erb(:listing)
  end
end
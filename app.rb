require "sinatra/base"
require "sinatra/reloader"
require_relative "./lib/listing_repository"
require_relative "./lib/database_connection"

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    repo = ListingRepository.new
    @listings = repo.all
    return erb(:index)
  end

  get '/listing/:id' do
    repo = ListingRepository.new
    @listing = repo.find(params[:id])
  
    return erb(:listing)
  end

  post '/booking/:id' do
    repo = ListingRepository.new
    @listing = repo.find(params[:id])
    
    return erb(:confirm)
  end

  get '/new_listing' do
    return erb(:new_listing)
  end

  post '/new_listing' do 
    repo = ListingRepository.new
    space = Listing.new

    space.title = params[:title]
    space.description = params[:description]
    space.img = params[:img]
    space.price = params[:price]
    space.location = params[:location]
    space.user_id = params[:user_id]
    @listing = repo.create(space)

    @listing_title = space.title
    @listing_img = space.img
    return erb(:new_listing_confirmed)
  end

  get '/login' do
    return erb(:login)
  end

  post '/login' do
    repo = UserRepository.new
    email = params[:email]
    password = params[:password]

    if repo.sign_in(email, password) == true
      @user = repo.find_by_email(email)
      session[:user_id] = @user.id
      return erb(:login_success)
    else
      status 400
      return 'Email and password do not match. Please go back and try again'
    end
  end

end

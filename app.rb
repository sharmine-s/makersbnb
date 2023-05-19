require "sinatra/base"
require "sinatra/reloader"
require 'bcrypt'
require 'sinatra/flash'
require_relative "./lib/listing_repository"
require_relative "./lib/database_connection"
require_relative "./lib/user_repository"
require_relative "./lib/date_repository"

DatabaseConnection.connect

class Application < Sinatra::Base
  enable :sessions
  # enable Sinatra::Flash
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
    
  end

  get '/' do
    repo = ListingRepository.new
    @listings = repo.all
    return erb(:index)
  end

  get '/listing/:id' do
    repo_date = DateRepository.new
    repo_list = ListingRepository.new
    eyedee = params[:id]

    @dates = repo_date.find_listing_id(eyedee)

    @listing = repo_list.find(params[:id])
    # p @available_dates
    
    return erb(:listing)
    # <% @available_dates.each do |date| %> re-add under "Pick a date .erb"
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
    repo_list = ListingRepository.new
    space = Listing.new
    repo_date = DateRepository.new
    new_date = Date.new

    space.title = params[:title]
    space.description = params[:description]
    space.img = params[:img]
    space.price = params[:price]
    space.location = params[:location]
    space.user_id = params[:user_id]
    
    @listing = repo_list.create(space)
    new_repo_list = ListingRepository.new.all
    
    @listing_title = space.title
    @listing_img = space.img

    available_dates = [params[:date_1], params[:date_2], 
    params[:date_3], params[:date_4], params[:date_5], 
    params[:date_6], params[:date_7]]

    selected_dates = available_dates.select { |date| date != nil }
    
    selected_dates.each do |date|
      new_date.listing_id = new_repo_list[-1].id
      new_date.date = date
      repo_date.create(new_date)
    end

    return erb(:new_listing_confirmed)
  end

  get '/signup' do
    return erb(:signup)
  end 

  post '/signup' do 
    name = params[:name]
    @username = params[:username]
    @email = params[:email]
    password = params[:password]

    if name == "" || @username == "" || @email == "" || password == ""
      flash[:error] = 'Please fill in every field'
      return redirect '/signup'
    else

    
    new_user = User.new
    new_user.name = name
    new_user.username = @username
    new_user.email = @email 
    new_user.password = password
    UserRepository.new.create(new_user)
    return erb(:account_created)
  end
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
      flash[:error] = 'Invalid email or password'
      return redirect '/login'
    end
  end

  get '/logout' do
    session[:user_id] = nil
    return redirect('/')
  end


  get '/booking_request' do
    repo = ListingRepository.new
    @listing = repo.find(1)
    return erb(:booking_request)
  end

  post '/booking_request' do
    return erb(:booking_confirm)
  end

  get '/account/:id' do
    @user = UserRepository.new.find_by_id(session[:user_id])

    # @listings = ListingRepository.new.find(session[:user_id])
    @listings = ListingRepository.new.all
    @current_user = session[:user_id]
    
    return erb(:account_page)
  end
end

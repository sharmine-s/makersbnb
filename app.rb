require "sinatra/base"
require "sinatra/reloader"
require_relative "lib/listing_repository"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    return erb(:index)
  end

  get "/listing/:id" do
    return erb(:listing)
  end

  post "/booking/:id" do
    @listing = ListingRepository.new

    return erb(:confirm)
  end
end

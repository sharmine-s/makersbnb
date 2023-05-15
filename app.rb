require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    return erb(:index)
  end

  get '/listing/:id' do
    return erb(:listing)
  end
end

=begin IMPLIMENT WHEN DATABASE ADDED
<% @listings.each do |listing| %>
<%= listing.title %>
<%= listing.description %>
<%= listing.location %>
<%= listing.price %>
<% end %>
=end
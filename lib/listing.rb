class Listing
  attr_accessor :id, :title, :description, :img :price, :location, :user_id
  def initialize(title,description, img_link, price, location, user_id)
    @title = title
    @description = description
    @img_link = img_link
    @price = price
    @location = location
    @user_id = user_id
  end
end

# to add a new listing in the repository or testings use this format
# Listing.new("title", "description", "img_link", price, "location", user_id)
# a new listing will be created with the content you've added you can then use the create function to add it to the table 
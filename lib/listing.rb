class Listing
  attr_accessor :id, :title, :description, :img, :price, :location, :user_id
 
end

# to add a new listing in the repository or testings use this format
# Listing.new("title", "description", "img_link", price, "location", user_id)
# a new listing will be created with the content you've added you can then use the create function to add it to the table 
require 'listing'

class ListingRepository
  def all
    query = 'SELECT * FROM listings;'
    result = DatabaseConnection.exec_params(query, [])

    listings = []

    result.each do |listing|
      listings << create_listing_object(listing)
    end

    return listings
  end

  def find

  end
  def create
  end

  private 

  def create_listing_object(record)
    listing = Listing.new
    listing.id = record['id']
    listing.title = record['title']
    listing.description = record['description']
    listing.img = record['img']
    listing.price = record['price']
    listing.location = record['location']
    listing.user_id = record['user_id']

    return listing
  end
end
require_relative 'listing'

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

  def find(id)
    result_set = fetch_data(id)
    create_listing_object(result_set.first)
  end

  private
  
  def fetch_data(id)
    sql = 'SELECT id, title, description, img, price, location, user_id FROM listings WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end

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
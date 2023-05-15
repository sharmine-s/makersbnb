class ListingRepository
  def all
  end


  def find(id)
    result_set = fetch_data(id)
    build_listing(result_set.first)
  end

  private
  
  def fetch_data(id)
    sql = 'SELECT id, title, description, img, price, location, user_id FROM listings WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end



  def build_listing(data)
    Listing.new.tap do |listing|
     listing.id = data['id'].to_i
     listing.title = data['title']
     listing.description= data['description']
     listing.img= data['img']
     listing.price= data['price']
     listing.location= data['location']
     listing.user_id = data['user_id']
    end
  end

  def create
  end
end
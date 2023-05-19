require_relative './user'
require_relative './listing_repository'
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    params =[]
    result_set = DatabaseConnection.exec_params(sql, params)
    users = []
    result_set.each do |record|
     users << create_user_object(record)
     end
   return users
  end
  
  def create(user)
    encrypted = BCrypt::Password.create(user.password)
    sql = 'INSERT INTO users (name, username, email, password) VALUES ($1,$2, $3, $4)'
    params = [user.name, user.username, user.email, encrypted]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  def find_by_id(id)
  
    sql = 'SELECT id, name, username, password, email
            FROM users 
            WHERE id = $1;'
    
    sql_params = [id]

    result = DatabaseConnection.exec_params(sql, sql_params)

    if !result.ntuples.zero?
        record = result[0]
        return create_user_object(record)
    else
        return nil
    end

  end


  def find_by_email(email)
  
    sql = 'SELECT id, name, username, password, email
            FROM users 
            WHERE email = $1;'
    
    sql_params = [email]

    result = DatabaseConnection.exec_params(sql, sql_params)

    if !result.ntuples.zero?
        record = result[0]
        return create_user_object(record)
    else
        return nil
    end

  end

def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?
    
    stored_password = BCrypt::Password.new(user.password)
    return true if stored_password == submitted_password

    # return false

    # stored_password = user.password

    # return true if stored_password == submitted_password

    return false
end

# def find_with_listings(id)
#   sql = 'SELECT listings.title, listings.description, listings.img, listings.price, listings.price
#             FROM listings
#             JOIN users ON listings.user_id = users.id
#             WHERE users.id = $1;'
  
#   result = DatabaseConnection.exec_params(sql, [id])
#   create_listing_object(result.first)
# end

  private

  def create_user_object(record)
    user = User.new
     user.id = record['id']
     user.name = record['name']
     user.username = record['username']
     user.email = record['email']
     user.password = record['password']
     
     return user
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

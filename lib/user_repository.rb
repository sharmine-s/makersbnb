require_relative './user'
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
    sql = 'INSERT INTO users (name, username, password, email) VALUES ($1,$2, $3, $4)'
    params = [user.name, user.username, user.password, user.email]
    DatabaseConnection.exec_params(sql, params)
    return nil
  end

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

end


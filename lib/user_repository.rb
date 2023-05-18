require_relative './user'

class UserRepository

    def find_by_email(email)
  
        sql = 'SELECT id, name, username, password, email 
                FROM users 
                WHERE email = $1;'
        
        sql_params = [email]
    
        result = DatabaseConnection.exec_params(sql, sql_params)
    
        record = result[0]
    
        return create_user_object(record)

    end

    def sign_in(email, submitted_password)
        user = find_by_email(email)
    
        return nil if user.nil?
        
        # encrypted version:
        # stored_password = BCrypt::Password.new(user.password)
        # return true if stored_password == submitted_password
    
        # return false

        stored_password = user.password

        return true if stored_password == submitted_password
    
        return false
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
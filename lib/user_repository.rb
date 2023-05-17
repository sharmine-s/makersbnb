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
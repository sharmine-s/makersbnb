require_relative 'date'

class DateRepository
    def all
        sql = 'SELECT * FROM dates;'
        result = DatabaseConnection.exec_params(sql, [])

        dates = []

        result.each do |record|
            dates << create_date_object(record)
        end

        return dates
    end
    
    def create(availability)
        sql = 'INSERT INTO dates (listing_id, date, guest_id) VALUES ($1, $2, $3);'
        sql_params = [availability.listing_id, availability.date, availability.guest_id]
        DatabaseConnection.exec_params(sql, sql_params)

        return nil
    end

    def delete

    end

    def find(id)
        result_set = fetch_data(id)
        create_date_object(result_set.first)
    end

    def find_listing_id(listing_id)
        sql = 'SELECT * FROM dates WHERE listing_id = $1;'
        sql_params = [listing_id]
        result = DatabaseConnection.exec_params(sql, sql_params)

        dates = []

        result.each do |record|
            dates << create_date_object(record)
        end

        return dates

=begin
        sql = 'SELECT id, listing_id, date, guest_id FROM dates WHERE listing_id = $1;'
        sql_params = listing_id
        result = DatabaseConnection.exec_params(sql, sql_params)
        p result
        p "hello!"
        dates = []

        result.each do |record|
            create_date_object(record)
            dates << record
        end

        return dates
=end
    end

    private
        
    def fetch_data(id)
        sql = 'SELECT id, listing_id, date, guest_id FROM dates WHERE id = $1;'
        DatabaseConnection.exec_params(sql, [id])
    end

    def create_date_object(record)
        date_object = Date.new
        date_object.id = record['id']
        date_object.listing_id = record['listing_id']
        date_object.date = record['date']
        date_object.guest_id = record['guest_id']

        return date_object
    end
end
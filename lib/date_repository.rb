require_relative 'date'

class DateRepository
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
        create_listing_object(result_set.first)
    end

    private
        
    def fetch_data(id)
        sql = 'SELECT id, listing_id, date, guest_id FROM dates WHERE id = $1;'
        DatabaseConnection.exec_params(sql, [id])
    end

    def create_listing_object(record)
        date = Date.new
        date.id = record['id']
        date.listing_id = record['listing_id']
        date.date = record['date']
        date.guest_id = record['guest_id']

        return date
    end
end
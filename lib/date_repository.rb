require_relative 'date'

class DateRepository
    def create
        sql = 'INSERT INTO dates (listing_id, date, requested, guest_id, confirmed) VALUES ($1, $2, $3, $4, $5);'
        sql_params = [date.listing_id, date.date, date.requested, date.guest_id, date.confirmed]
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
        sql = 'SELECT id, listing_id, date, requested, guest_id, confirmed FROM dates WHERE id = $1;'
        DatabaseConnection.exec_params(sql, [id])
    end

    def create_listing_object(record)
        date = Date.new
        date.id = record['id']
        date.listing_id = record['listing_id']
        date.date = record['date']
        date.requested = record['requested']
        date.guest_id = record['guest_id']
        date.confirmed = record['confirmed']
        
        return date
    end
end
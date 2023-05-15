require 'listing'
require 'listing_repository'


RSpec.describe ListingRepository do

    def reset_listings_table
        seed_sql = File.read('spec/seeds_listings.sql')
        connection = PG.connect({ host: '127.0.0.1', dbname: 'makersbnb_test' })
        connection.exec(seed_sql)
    end
        
    describe ListingRepository do
        before(:each) do
            reset_listings_table
        end 
    
        it 'finds listing 1' do
          repo = ListingRepository.new
          listing = repo.find(1)
        #   expect(listing.title).to eq('HollyWood Mansion')
          expect(listing.description).to eq('A beautiful mansion right under the hollywood sign in LA')

        end




    end

    


end 
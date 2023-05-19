require_relative '../lib/database_connection'
require_relative '../lib/date_repository'
require_relative './spec_helper'

describe DateRepository do
  before(:each) do 
    reset_all_tables
  end

    
  it 'finds date 1' do
    repo = DateRepository.new
    date = repo.find(1)

    expect(date.date).to eq('2023-08-01')
  end

  it 'create and find a new date' do # change after new database
    repo = DateRepository.new
    new_date = Date.new

    new_date.listing_id = '1'
    new_date.date = '2023-08-06'
    new_date.guest_id = nil

    repo.create(new_date)
    fresh_date = repo.find(8)

    expect(fresh_date.listing_id).to eq('1')
    expect(fresh_date.date).to eq('2023-08-06')
    expect(fresh_date.guest_id).to eq(nil)
  end

  it 'uses a listing id to find the relevant dates' do 
    repo = DateRepository.new

    listing_id = '1'
    dates_details = repo.find_listing_id(listing_id)
    expect(dates_details[0].date).to eq "2023-08-01"
  end
end 
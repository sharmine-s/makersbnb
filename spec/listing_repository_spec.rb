require_relative '../lib/listing_repository'
require_relative './spec_helper'

describe ListingRepository do
  before(:each) do 
    reset_all_tables
  end

  it "Returns all listings" do
    repo = ListingRepository.new
    listings = repo.all

    expect(listings[0].title). to eq('HollyWood Mansion')
    expect(listings[0].description). to eq('A beautiful mansion right under the hollywood sign in LA')
    expect(listings[0].img). to eq('https://img.gtsstatic.net/reno/imagereader.aspx?imageurl=https%3A%2F%2Fapi-prod.corelogic.com%2Ftrestle%2FMedia%2FCRMLS%2FProperty%2FPHOTO-jpeg%2F1013309050%2F1%2FMTU3Mi8yMjU2LzE5%2FMTkvODYyMy8xNjY2MzU5MzMy%2F_6mUwpQWQj53sOa1IBCE020pr-hhR0aS3syDBif_gPc%3Fdate%3D2023-02-15&option=N&h=472&permitphotoenlargement=false')
    expect(listings[0].price). to eq('$100.00')
    expect(listings[0].location). to eq('Hollywood,LA')
  end

    
  it 'finds listing 1' do
    repo = ListingRepository.new
    listing = repo.find(1)
  #   expect(listing.title).to eq('HollyWood Mansion')
    expect(listing.description).to eq('A beautiful mansion right under the hollywood sign in LA')

  end

end 
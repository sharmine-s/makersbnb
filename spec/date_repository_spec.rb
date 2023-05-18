require_relative '../lib/date_repository'
require_relative './spec_helper'

describe DateRepository do
  before(:each) do 
    reset_all_tables
  end

    
  it 'finds date 1' do
    repo = DateRepository.new
    date = repo.find(1)
  #   expect(date.title).to eq('HollyWood Mansion')
    expect(date.requested).to eq(false)

  end

  it 'create and find a new date' do # change after new database
    repo = DateRepository.new
    new_date = Date.new

    new_date.title = 'London Mansion'
    new_date.description = 'A beautiful mansion right under the hollywood sign in London'
    new_date.img = 'https://img.gtsstatic.net/reno/imagereader.aspx?imageurl=https%3A%2F%2Fapi-prod.corelogic.com%2Ftrestle%2FMedia%2FCRMLS%2FProperty%2FPHOTO-jpeg%2F1013309050%2F1%2FMTU3Mi8yMjU2LzE5%2FMTkvODYyMy8xNjY2MzU5MzMy%2F_6mUwpQWQj53sOa1IBCE020pr-hhR0aS3syDBif_gPc%3Fdate%3D2023-02-15&option=N&h=472&permitphotoenlargement=false'
    new_date.price = 100.00
    new_date.location = 'London'
    new_date.user_id = 1
  
    repo.create(new_space)
    fresh_date = repo.all

    expect(fresh_date.last.title).to eq('London Mansion')
    expect(fresh_date.last.description).to eq('A beautiful mansion right under the hollywood sign in London')
    expect(fresh_date.last.location).to eq('London')
  end
end 
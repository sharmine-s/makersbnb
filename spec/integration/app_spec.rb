require "spec_helper"
require "rack/test"
require_relative '../../app'
require 'json'


describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # Write your integration tests below.
  # If you want to split your integration tests
  # accross multiple RSpec files (for example, have
  # one test suite for each set of related features),
  # you can duplicate this test file to create a new one.


  context 'GET /' do
    it 'should get the homepage' do
      response = get('/')

      expect(response.status).to eq(200)
      expect(response.body).to include("<h1>Welcome to MakersBnB</h1>")
      expect(response.body).to include("HollyWood Mansion")
      expect(response.body).to include("A beautiful mansion right under the hollywood sign in LA")
      expect(response.body).to include("https://img.gtsstatic.net/reno/imagereader.aspx?imageurl=https%3A%2F%2Fapi-prod.corelogic.com%2Ftrestle%2FMedia%2FCRMLS%2FProperty%2FPHOTO-jpeg%2F1013309050%2F1%2FMTU3Mi8yMjU2LzE5%2FMTkvODYyMy8xNjY2MzU5MzMy%2F_6mUwpQWQj53sOa1IBCE020pr-hhR0aS3syDBif_gPc%3Fdate%3D2023-02-15&option=N&h=472&permitphotoenlargement=false")
      expect(response.body).to include("$100.00/night")
      expect(response.body).to include("Hollywood,LA")
    end
  end

  context 'GET /listing/:id' do
    it 'should show the information of listing 1' do
      response = get('/listing/1')

      expect(response.status).to eq 200
      expect(response.body).to include ('h1>HollyWood Mansion</h1>')
    end
  end


  context 'GET /new_listing' do
    it 'should return a form to create a new listing' do
     response = get('/new_listing')
     expect(response.status).to eq(200)
     expect(response.body).to include('Create a new listing')
     expect(response.body).to include('<title>New Listing</title>')
     expect(response.body).to include('<label>Title </label>')
     expect(response.body).to include('form action="/new_listing" method="POST"')
    end
  end

  context 'POST /new_listing' do
    it 'confirm the listing has been posted' do
     response = post(
      '/new_listing',
      title: 'London Mansion', 
      description: 'A beautiful mansion right under the hollywood sign in London', 
      price: 100.00,
      img: 'https://img.gtsstatic.net/reno/imagereader.aspx?imageurl=https%3A%2F%2Fapi-prod.corelogic.com%2Ftrestle%2FMedia%2FCRMLS%2FProperty%2FPHOTO-jpeg%2F1013309050%2F1%2FMTU3Mi8yMjU2LzE5%2FMTkvODYyMy8xNjY2MzU5MzMy%2F_6mUwpQWQj53sOa1IBCE020pr-hhR0aS3syDBif_gPc%3Fdate%3D2023-02-15&option=N&h=472&permitphotoenlargement=false',
      location: 'London',
      user_id: 1
    )

     expect(response.status).to eq(200)
     expect(response.body).to include('Listing confirmed: London Mansion')
     expect(response.body).to include("<a href='/'> <button type")
    end
  end
end

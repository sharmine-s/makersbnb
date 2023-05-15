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
      expect(response.body).to include("<p>Location: Hollywood Hills</p>")
      expect(response.body).to include("<p>Penthouse Suite - North Hills</p>")
      expect(response.body).to include("<a href='/listing/1'> See More </a>")
      expect(response.body).to include("<img src='https://robbreport.com/wp-content/uploads/2019/03/002-crop.jpg?w=1000' alt='Nicolas Cage>")
    end
  end
end

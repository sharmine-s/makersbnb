
require_relative '../lib/user_repository'
require_relative '../lib/user'
require_relative './spec_helper'
require 'bcrypt'
require 'rack/test'
require 'json'


describe UserRepository do
  before(:each) do 
    reset_all_tables
  end
  context 'creating a user' do
    it 'shows a user with all the values in the database' do
    repo = UserRepository.new
    expect(repo.all.length).to eq 4
    user = User.new
     user.name = 'adolfo strange'
     user.username = 'strange'
     user.password = BCrypt::Password.create('password')
     user.email = 'adolfo@email.com'
    repo.create(user)
    expect(repo.all.length).to eq 5
    expect(repo.all.last.username).to eq 'strange'
  end
end

  context 'find_by_email' do
    it 'returns user object with given email' do 
      repo = UserRepository.new
      result = repo.find_by_email('john1@smith.com')

      expect(result.name).to eq('John Smith')
      expect(result.username).to eq('user1')
    end
  end

  context 'find with listings' do
    it 'should return all listings from user 1' do
      repo = UserRepository.new
      result = repo.find_with_listings(1)

      expect(result.title).to eq 'HollyWood Mansion' 
    end
  end

end
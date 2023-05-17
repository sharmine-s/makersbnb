
require_relative '../lib/user_repository'
require_relative '../lib/user'
require_relative './spec_helper'
require 'bcrypt'

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

end
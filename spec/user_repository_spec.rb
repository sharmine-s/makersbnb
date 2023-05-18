require 'spec_helper'
require 'rack/test'
require 'user'
require 'user_repository'
require 'json'


describe UserRepository do
  before(:each) do 
    reset_all_tables
  end

  context 'find_by_email' do
    it 'returns user object with given email' do 
      repo = UserRepository.new
      result = repo.find_by_email('john1@smith')

      expect(result.name).to eq('john smith')
      expect(result.username).to eq('user1')
    end
  end

end
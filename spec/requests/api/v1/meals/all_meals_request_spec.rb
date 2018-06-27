require 'rails_helper'

describe 'Meals API' do
  context 'when I send a GET request to /api/v1/meals' do
    it 'all meals and their foods in the database currently are returned' do
      create(:meal)
      
      create_list(:food, 3)

      get '/api/v1/meals'

      expect(response).to be_successful


    end
  end
end

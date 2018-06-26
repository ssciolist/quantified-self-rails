require 'rails_helper'

describe 'Foods API' do
  context 'when I send a GET request to /api/v1/foods' do
    it 'all foods in the database currently are returned' do
      create_list(:food, 3)

      get '/api/v1/foods'

      expect(response).to be_successful

      foods = JSON.parse(response.body)

      expect(foods.count).to eq(3)
    end
  end
end

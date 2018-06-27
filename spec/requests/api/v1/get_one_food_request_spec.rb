require 'rails_helper'

describe 'Foods API' do
  context 'when I send a GET request to /api/v1/foods' do
    it 'all foods in the database currently are returned' do
      create(:food)

      get '/api/v1/foods/1'

      expect(response).to be_successful

      food = JSON.parse(response.body)

      expect(foods['name']).to eq('banana')
      expect(foods['calories']).to eq(12)
    end
  end
end

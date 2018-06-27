require 'rails_helper'

describe 'Foods API' do
  context 'when I send a POST request to /api/v1/foods with correct body params' do
    it 'a food is created and returned' do
      params = { 'food': { 'name': 'chocolate bar', 'calories': '410'} }
      post '/api/v1/foods', params: params

      new_food = JSON.parse(response.body)

      expect(new_food['name']).to eq('chocolate bar')
      expect(new_food['calories']).to eq(410)
    end
  end

  context 'when I send a POST request to /api/v1/foods with incorrect body params' do
    it 'a 400 status code is returned' do
      params = { 'food': { 'name': 'veal'} }
      post '/api/v1/foods', params: params

      expect(response.status).to eq(400)
    end
  end
end

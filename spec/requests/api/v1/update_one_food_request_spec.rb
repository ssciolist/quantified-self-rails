require 'rails_helper'

describe 'Foods API' do
  context 'when I send a PATCH request to /api/v1/foods/:id with correct body params' do
    it 'the updated food is returned' do
      create(:food)
      params = { 'food': { 'name': 'sweet decadent ice cream', 'calories': '800'} }

      patch '/api/v1/foods/1', params: params

      expect(response).to be_successful

      better_food = JSON.parse(response.body)

      expect(better_food['name']).to eq('sweet decadent ice cream')
      expect(better_food['calories']).to eq(800)
    end
  end

  context 'when I send a PATCH request to /api/v1/foods/:id with incorrect body params' do
    it '400 status code is returned' do
      create(:food)
      params = { 'food': { 'kosher': 'no'} }

      patch '/api/v1/foods/1', params: params

      expect(response.status).to eq(400)
    end
  end
end

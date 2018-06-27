require 'rails_helper'

describe 'Meals API' do
  context 'when I send a correct POST request to /api/v1/meals/:meal_id/foods/:food_id' do
    it 'a food is created and returned' do
      meal = create(:meal)
      food = create(:food)

      post "/api/v1/meals/#{meal.id}/foods/#{food.id}"
      success = JSON.parse(response.body)

      expect(success['message']).to eq("Successfully added #{food.name} to #{meal.name}")
    end
  end

  context 'when I send an incorrect POST request to /api/v1/meals/:meal_id/foods/:food_id' do
    it 'a 400 status code is returned' do
      meal = create(:meal)

      post "/api/v1/meals/#{meal.id}/foods/1"

      expect(response.status).to eq(400)
    end
  end
end

require 'rails_helper'

describe 'Meals API' do
  context 'when I send a correct DELETE request to /api/v1/meals/:meal_id/foods/:food_id' do
    it 'a food is removed' do
      meal = create(:meal)
      meal.foods.create(name: 'Coconut donut', calories: 300)
      meal.foods.create(name: 'Saffron Rice', calories: 200)

      delete "/api/v1/meals/#{meal.id}/foods/1"
      success = JSON.parse(response.body)

      expect(success['message']).to eq("Successfully removed Coconut donut from #{meal.name}")
    end
  end

  context 'when I send an incorrect DELETE request to /api/v1/meals/:meal_id/foods/:food_id' do
    it 'a 400 status code is returned' do
      meal = create(:meal)
      meal.foods.create(name: 'Coconut donut', calories: 300)

      delete "/api/v1/meals/#{meal.id}/foods/2"

      expect(response.status).to eq(400)
    end
  end
end

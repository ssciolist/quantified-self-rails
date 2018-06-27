require 'rails_helper'

describe 'Meals API' do
  context 'when I send a GET request to /api/v1/meals/:meal_id/foods' do
    it 'all meals and their foods in the database currently are returned' do
      meal = create(:meal)
      meal.foods.create(name: 'Coconut donut', calories: 300)
      meal.foods.create(name: 'Saffron Rice', calories: 200)

      get "/api/v1/meals/#{meal.id}/foods"

      foods = JSON.parse(response.body)['foods']
      first_food = foods[0]

      expect(foods.count).to eq(2)
      expect(first_food).to have_key('id')
      expect(first_food['name']).to eq('Coconut donut')
      expect(first_food['calories']).to eq(300)
    end
  end
end

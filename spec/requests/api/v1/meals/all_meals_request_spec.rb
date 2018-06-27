require 'rails_helper'

describe 'Meals API' do
  context 'when I send a GET request to /api/v1/meals' do
    it 'all meals and their foods in the database currently are returned' do
      meal = create(:meal)
      meal.foods.create(name: 'Coconut donut', calories: 300)
      meal.foods.create(name: 'Saffron Rice', calories: 200)

      meal2 = create(:meal)
      meal2.foods.create(name: 'Mango', calories: 300)

      get '/api/v1/meals'

      expect(response).to be_successful

      meals = JSON.parse(response.body)
      first_meal = meals[0]

      expect(meals.count).to eq(2)
      expect(first_meal).to have_key('id')
      expect(first_meal).to have_key('name')
      expect(first_meal).to have_key('foods')
      expect(first_meal['foods'].first['name']).to eq('Coconut donut')
    end
  end
end

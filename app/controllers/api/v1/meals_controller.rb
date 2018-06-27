class Api::V1::MealsController < ApplicationController

  def index
    render json: Meal.all
  end

  def show
    render json: Meal.find(params['meal_id'])
  end

  def update
    meal = Meal.find(params['meal_id'])
    food = Food.find(params['food_id'])
    meal.foods << food
    render json: { message: "Successfully added #{food.name} to #{meal.name}" }
  end

end

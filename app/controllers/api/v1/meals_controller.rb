class Api::V1::MealsController < ApplicationController
  before_action :find_food_and_meal, only: [:update, :destroy]

  def index
    render json: Meal.all
  end

  def show
    render json: Meal.find(params['meal_id'])
  end

  def update
    meal = Meal.find(params['meal_id'])
    food = Food.find(params['food_id'])
    @meal.foods << @food
    render json: { message: "Successfully added #{@food.name} to #{@meal.name}" }
  end

  def destroy
    meal_food = MealFood.find_by(meal_id: params['meal_id'], food_id: params['food_id'])
    if meal_food.destroy
      render json: { message: "Successfully removed #{@food.name} from #{@meal.name}" }
    end
  end

  private

  def find_food_and_meal
    @food = Food.find(params[:food_id])
    @meal = Meal.find(params[:meal_id])
  end

end

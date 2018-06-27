class Api::V1::FoodsController < ApplicationController

  def index
    render json: Food.all
  end

  def create
    food = Food.new(food_params)
    if food.save
      render json: food
    else
      render status: 400
    end
  end

  def show
    render json: Food.find(params[:id])
  end

  def update
    food = Food.find(params[:id])
    food.update(food_params)
    if food.name == food_params['name']
      render json: food
    else
      render status: 400
    end
  end

  def destroy
    food = Food.find(params[:id])
    if food.delete
      render json: 'bye food', status: 204
    else
      render status: 404
    end
  end

  private

  def food_params
    params.require('food').permit('name', 'calories')
  end

end

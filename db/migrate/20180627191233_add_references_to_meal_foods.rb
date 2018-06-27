class AddReferencesToMealFoods < ActiveRecord::Migration[5.2]
  def change
    add_reference :meal_foods, :meal, foreign_key: true
    add_reference :meal_foods, :food, foreign_key: true
  end
end

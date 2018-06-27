FactoryBot.define do
  factory :meal do
    name { ['breakfast', 'lunch', 'dinner', 'snack'].sample }
  end
end

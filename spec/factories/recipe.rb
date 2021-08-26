FactoryBot.define do
  factory :recipe do
    user
    title { Faker::Food.dish }
    preparation_description { Faker::Food.description }
    difficulty { rand(0..2) }
    time_in_minutes_needed { rand(5..60) }
    categories { create_list(:category, rand(1..3)) }
    layout { rand(0..2) }
    status { 1 }

    after(:build) do |recipe|
      recipe.ingredients_recipes << build(:ingredients_recipe, recipe: recipe)
    end
  end
end

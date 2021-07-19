require "rails_helper"

RSpec.describe RecipeScore, type: :model do
  describe "validations" do
    subject { RecipeScore.new(user_id: 1, recipe_id: 1, score: 5) }

    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:recipe_id) }
    it { is_expected.to validate_presence_of(:recipe_id) }
    it { is_expected.to validate_presence_of(:score) }
    it { is_expected.to validate_inclusion_of(:score).in_array((1..5).to_a) }
  end

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:recipe) }
  end
end

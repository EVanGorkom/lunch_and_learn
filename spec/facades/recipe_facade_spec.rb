require 'rails_helper'

RSpec.describe RecipeFacade, type: :facade do
  describe "instance methods" do
    it "search_recipes(country)", :vcr do
      recipe_facade = RecipeFacade.new
      country = 'Belize'
      recipes = recipe_facade.search_recipes(country)

      expect(recipes).to be_an Array
      expect(recipes).not_to be_empty
      expect(recipes.first).to be_a RecipePoro
    end
  end
end
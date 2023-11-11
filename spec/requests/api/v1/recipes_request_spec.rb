require 'rails_helper'

RSpec.describe "Recipes by Country", :vcr do
  it "can retrieve all recipes from a certain country" do
    params = { country: "Guatemala" }
    get "/api/v1/recipes", params: params

  end
end
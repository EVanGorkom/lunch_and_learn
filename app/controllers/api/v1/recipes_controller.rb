class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country].present?
      recipes = RecipeFacade.new.search_recipes(params[:country])
    else 
      random_country = CountryFacade.new.random_country
      recipes = RecipeFacade.new.search_recipes(random_country)
    end
    
    render json: RecipeSerializer.new(recipes)
  end
end

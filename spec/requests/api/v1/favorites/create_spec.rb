require 'rails_helper'

RSpec.describe "Favorites" do
  it "Can create new favorite recipe" do
    user = User.create(name: 'John', email: 'john@example.com', password: 'secret-password', password_confirmation: 'secret-password')

    new_fav_data = {
      'api_key': "#{user.api_key}",
      'country': 'japan',
      'recipe_link': "https://www.supertastyfood.com/",
      'recipe_title': "The Best Tonkatsu Ramen"
    }

    post "/api/v1/favorites", params: new_fav_data, as: :json

    expect(response).to have_http_status(201)
  end

  it "Will return an error if the api key is invalid" do
    new_fav_data = {
      'api_key': "haha-fake-api_key1234",
      'country': 'japan',
      'recipe_link': "https://www.supertastyfood.com/",
      'recipe_title': "The Best Tonkatsu Ramen"
    }

    post "/api/v1/favorites", params: new_fav_data, as: :json

    expect(response).to have_http_status(401)
  end
end
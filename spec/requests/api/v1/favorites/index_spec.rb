require 'rails_helper'

RSpec.describe 'Favorites by User' do
  it "Can retrieve favorites for a user" do
    user = User.create(name: 'John', email: 'john@example.com', password: 'secret-password', password_confirmation: 'secret-password')
    fav1 = user.favorites.create(country: 'japan', recipe_link: "https://www.supertastyfood.com/", recipe_title: "The Best Tonkatsu Ramen")
    fav2 = user.favorites.create(country: 'mexico', recipe_link: "https://www.supertastyfood.com/", recipe_title: "The Best Flautas Ever")

    api = { api_key: "#{user.api_key}" }

    get "/api/v1/favorites", params: api #, as: :json
    # Adding the ghost code above changes the route request to a 'post' even if it's written as a 'get'

    expect(response).to have_http_status(200)

    json_response = JSON.parse(response.body)
    expect(json_response["data"]).to be_a Array

    # First Favorite
    expect(json_response['data'][0]['id']).to eq("#{fav1.id}")
    expect(json_response['data'][0]['type']).to eq('favorite')
    expect(json_response['data'][0]['attributes']['recipe_title']).to eq("#{fav1.recipe_title}")
    expect(json_response['data'][0]['attributes']['recipe_link']).to eq("#{fav1.recipe_link}")
    expect(json_response['data'][0]['attributes']['country']).to eq("#{fav1.country}")
    expect(json_response['data'][0]['attributes']['created_at']).to be_a String

    # Second Favorite
    expect(json_response['data'][1]['id']).to eq("#{fav2.id}")
    expect(json_response['data'][1]['type']).to eq('favorite')
    expect(json_response['data'][1]['attributes']['recipe_title']).to eq("#{fav2.recipe_title}")
    expect(json_response['data'][1]['attributes']['recipe_link']).to eq("#{fav2.recipe_link}")
    expect(json_response['data'][1]['attributes']['country']).to eq("#{fav2.country}")
    expect(json_response['data'][1]['attributes']['created_at']).to be_a String
  end

  it "Will return and empty array if the user has no favorites" do
    user = User.create(name: 'John', email: 'john@example.com', password: 'secret-password', password_confirmation: 'secret-password')

    api = { api_key: "#{user.api_key}" }

    get "/api/v1/favorites", params: api

    expect(response).to have_http_status(200)

    json_response = JSON.parse(response.body)
    expect(json_response["data"]).to be_a Array
    expect(json_response["data"]).to eq([])
  end

  it "Will return an error if the api key is invalid" do
    user = User.create(name: 'John', email: 'john@example.com', password: 'secret-password', password_confirmation: 'secret-password')
    fav1 = user.favorites.create(country: 'japan', recipe_link: "https://www.supertastyfood.com/", recipe_title: "The Best Tonkatsu Ramen")
    fav2 = user.favorites.create(country: 'mexico', recipe_link: "https://www.supertastyfood.com/", recipe_title: "The Best Flautas Ever")

    api = { api_key: "fake-api_key1234" }

    get "/api/v1/favorites", params: api

    expect(response).to have_http_status(401)

    json_response = JSON.parse(response.body)
    expect(json_response).to be_a Hash
    expect(json_response["error"]).to eq("This is not a valid api key")
  end
end
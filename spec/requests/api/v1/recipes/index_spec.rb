require 'rails_helper'

RSpec.describe "Recipes by Country" do
  it "Can retrieve all recipes from a specific country", :vcr do
    params = { country: "Guatemala" }
    get "/api/v1/recipes", params: params

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response['data']).to be_an(Array)
    
    expect(json_response['data'][0]["id"]).to eq nil
    expect(json_response['data'][0]["type"]).to eq "recipes"
    expect(json_response['data'][0]["attributes"]["title"]).to eq "Chocolate Cake with Cashew Cream and Figs"
    expect(json_response['data'][0]["attributes"]["url"]).to eq "http://honestcooking.com/chocolate-cake-with-cashew-cream-and-figs/"
    expect(json_response['data'][0]["attributes"]["country"]).to eq "Guatemala"
    expect(json_response['data'][0]["attributes"]["image"]).to be_a String
  end

  it "Can retrieve all recipes from a random country" do
    params = { country: "random" }
    get "/api/v1/recipes", params: params

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response['data']).to be_an Array
    
    if json_response['data'] == []
      expect(json_response['data']).to eq([])
    else
      expect(json_response['data'][0]["id"]).to eq nil
      expect(json_response['data'][0]["type"]).to eq "recipes"
      expect(json_response['data'][0]["attributes"]["title"]).to be_a String
      expect(json_response['data'][0]["attributes"]["url"]).to be_a String
      expect(json_response['data'][0]["attributes"]["country"]).to be_a String
      expect(json_response['data'][0]["attributes"]["image"]).to be_a String
    end
  end

  it "It returns an empty array of data if the request is invalid", :vcr do
    params = { country: "asdfjkl;" }
    get "/api/v1/recipes", params: params

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response['data']).to be_an(Array)
    expect(json_response['data']).to eq []
  end
end
require 'rails_helper'

RSpec.describe "Tourism Sites Index" do
  it "Finds all of the Tourism Sites within 1000 meters of the capital city of a country", :vcr do
    params = { country: "France" }
    get "/api/v1/tourism_sites", params: params

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response['data']).to be_an(Array)

    expect(json_response['data'][0]['id']).to be nil
    expect(json_response['data'][0]['type']).to eq("tourist_site")
    expect(json_response['data'][0]['attributes']['name']).to eq('Palais du Louvre')
    expect(json_response['data'][0]['attributes']['address']).to eq("Louvre Palace, Place du Lieutenant Henri Karcher, 75001 Paris, France")
    expect(json_response['data'][0]['attributes']['place_id']).to eq("513025c70ed2af024059358e28f2356e4840f00101f90159c731000000000092031050616c616973206475204c6f75767265")
  end

  it "returns an empty array if the search parameter is invalid", :vcr do
    params = { country: "Antartica" }
    get "/api/v1/tourism_sites", params: params

    expect(response).to be_successful

    json_response = JSON.parse(response.body)

    expect(json_response['data']).to be_an(Array)
    expect(json_response['data']).to eq([])
  end
end
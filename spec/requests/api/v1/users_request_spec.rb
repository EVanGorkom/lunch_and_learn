require 'rails_helper'

RSpec.describe "Users" do
  it "Can create a new user" do
    user = {
      'name': "Snoopy",
      'email': "snoopdoggydog@gmail.com",
      'password': "password",
      'password_confirmation': "password"
    }
    headers = {
      content_type: "application/json"
    }
    post "/api/v1/users", headers: headers, params: user, as: :json

    expect(response).to be_successful

    new_user = User.last
    expect(new_user.name).to eq("Snoopy")
    expect(new_user.email).to eq("snoopdoggydog@gmail.com")

    json_response = JSON.parse(response.body)
    expect(json_response["data"]).to be_a Hash

    expect(json_response['data']['id']).to eq("#{new_user.id}")
    expect(json_response['data']['type']).to eq('user')
    expect(json_response['data']['attributes']['name']).to eq(new_user.name)
    expect(json_response['data']['attributes']['email']).to eq(new_user.email)
    expect(json_response['data']['attributes']['api_key']).not_to be_nil
  end

  it "Will send a error message in json if the passwords do not match" do
    user_params = {
      name: "Snoopy",
      email: "snoopdoggydog@gmail.com",
      password: "password",
      password_confirmation: "wrong-password"
    }
    headers = {
      content_type: "application/json"
    }
    post "/api/v1/users", headers: headers, params: user_params, as: :json

    expect(response).to be_successful

    json_response = JSON.parse(response.body)
    expect(json_response["error"]).to eq("Passwords do not match")
  end
end
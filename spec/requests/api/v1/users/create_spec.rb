require 'rails_helper'

RSpec.describe "Users" do
  it "Can create a new user" do
    user_data = {
      user: {
        'name': "Snoopy",
        'email': "snoopdoggydog@gmail.com",
        'password': "password",
        'password_confirmation': "password"
      }
    }
    headers = {
      content_type: "application/json"
    }
    post "/api/v1/users", headers: headers, params: user_data, as: :json

    expect(response).to have_http_status(201)

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
    user_data = {
      user: {
        name: "Snoopy",
        email: "snoopdoggydog@gmail.com",
        password: "password",
        password_confirmation: "wrong-password"
      }
    }
    headers = {
      content_type: "application/json"
    }
    post "/api/v1/users", headers: headers, params: user_data, as: :json

    expect(response).to have_http_status(422)

    json_response = JSON.parse(response.body)
    expect(json_response["error"]).to eq("Passwords do not match")
  end

  it "Will send an error message in json if the email is already used" do
    # Creating a user
    user_data1 = { 
      user: {
        name: "Snoopy",
        email: "snoopdoggydog@gmail.com",
        password: "password",
        password_confirmation: "password"
      }
    }
    headers = { content_type: "application/json" }
    post "/api/v1/users", headers: headers, params: user_data1, as: :json

    # New user using a taken email
    user_data2 = {
      user: {
        name: "Droopy",
        email: "snoopdoggydog@gmail.com",
        password: "password",
        password_confirmation: "password"
      }
    }
    headers = {
      content_type: "application/json"
    }
    post "/api/v1/users", headers: headers, params: user_data2, as: :json

    expect(response).to have_http_status(409)

    json_response = JSON.parse(response.body)
    expect(json_response["error"]).to eq("That email is already in use")
  end
end
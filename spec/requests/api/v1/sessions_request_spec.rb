require 'rails_helper'

RSpec.describe "Sessions" do
  it "Can create a new session for a user" do
    user = User.new(name: 'John', email: 'john@example.com', password: 'secret-password', password_confirmation: 'secret-password')
    user.save

    user_data = {
      'email': 'john@example.com',
      'password': 'secret-password'
    }

    post '/api/v1/sessions', params: user_data, as: :json

    expect(response).to have_http_status(200)

    json_response = JSON.parse(response.body)
    expect(json_response["data"]).to be_a Hash

    expect(json_response['data']['type']).to eq('user')
    expect(json_response['data']['id']).to eq("#{user.id}")
    expect(json_response['data']['attributes']['name']).to eq('John')
    expect(json_response['data']['attributes']['email']).to eq('john@example.com')
    expect(json_response['data']['attributes']['api_key']).to eq("#{user.api_key}")
  end

  it "Will give an error if the email is incorrect" do
    user = User.new(name: 'John', email: 'john@example.com', password: 'secret-password', password_confirmation: 'secret-password')
    user.save

    user_data = {
      'email': 'jon@example.com',
      'password': 'secret-password'
    }

    post '/api/v1/sessions', params: user_data, as: :json

    expect(response).to have_http_status(401)

    json_response = JSON.parse(response.body)
    expect(json_response["error"]).to eq("Incorrect email or password. You're welcome to try again though.")
  end

  it "Will give an error if the password is incorrect" do
    user = User.new(name: 'John', email: 'john@example.com', password: 'secret-password', password_confirmation: 'secret-password')
      user.save

    user_data = {
      'email': 'john@example.com',
      'password': 'wrong-password'
    }

    post '/api/v1/sessions', params: user_data, as: :json

    expect(response).to have_http_status(401)

    json_response = JSON.parse(response.body)
    expect(json_response["error"]).to eq("Incorrect email or password. You're welcome to try again though.")

  end
end
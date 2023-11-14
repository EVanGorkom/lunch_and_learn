require 'rails_helper'

RSpec.describe 'User Serializer' do
  it "returns the JSON User object within the serializer's format" do
    user = User.new(name: 'John', email: 'john@example.com', password: 'password', password_confirmation: 'password')
    user.save

    serialized_user = UserSerializer.new(user).serializable_hash

    expected_format = {
      data: {
        type: "user",
        id: "#{user.id}",
        attributes: {
          name: 'Snoopy',
          email: 'snoopdoggydog@gmail.com',
          api_key: "#{user.api_key}"
        }
      }
    }
  end
end
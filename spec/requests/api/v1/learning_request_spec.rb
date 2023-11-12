require 'rails_helper'

RSpec.describe 'Learning Resources by Country' do
  it "Can retrieve videos and images for the country" do
    params = { country: "Genovia" }
    get "/api/v1/learning_resources", params: params
    
    expect(response).to be_successful
  end
end
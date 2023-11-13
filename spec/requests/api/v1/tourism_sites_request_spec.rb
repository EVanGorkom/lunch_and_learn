require 'rails_helper'

RSpec.describe "Tourism Sites Index" do
  it "Finds all of the Tourism Sites within 1000 meters of the capital city of a country", :vcr do
    params = { country: "France" }
    get "/api/v1/tourism_sites", params: params

    expect(response).to be_successful
  end
end
require 'rails_helper'

RSpec.describe ResourceFacade, type: :facade do
  describe "instance methods" do
    it "find_resources(country)", :vcr do
      country = 'United States'

      resources = ResourceFacade.new.find_resources(country)

      expect(resources).to be_a ResourcePoro
      expect(resources.id).to be_nil
      expect(resources.country).to eq country
      expect(resources.video).to be_a Hash
      expect(resources.images).to be_an Array
      expect(resources.images.length).to eq 10
    end
  end
end

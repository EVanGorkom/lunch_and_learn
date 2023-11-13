require 'rails_helper'

RSpec.describe TourismSiteFacade, type: :facade do
  describe "instance methods" do
    it "find_sites(lon_lat)", :vcr do
      lon_lat = '6.26,53.35'

      sites = TourismSiteFacade.new.find_sites(lon_lat)
      
      expect(sites).to be_an Array
    end
  end
end

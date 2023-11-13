require 'rails_helper'

RSpec.describe GeoService, type: :service do
  describe "instance methods", :vcr do
    it "conn" do
      connection = GeoService.new.conn

      expect(connection).to be_a(Faraday::Connection)
    end

    it "get_url(link)" do
      geo_param = "6.26,53.35"

      fetched_url = GeoService.new.get_url("/v2/places?filter=circle:#{geo_param},1000")

      expect(fetched_url).to be_a Hash
    end

    it "find_sites(geo_param)" do
      geo_param = "6.26,53.35"
      
      searched_Geos = GeoService.new.find_sites(geo_param)

      expect(searched_Geos).to be_a Hash
    end
  end
end
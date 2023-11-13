require 'rails_helper'

RSpec.describe TourismSiteSerializer do
  it "returns the JSON tourist site object within the serializer's format" do
    site_data = {
      'id' => 1,
      'name' => 'Golden Gate Bridge',
      'address' => 'San Francisco, CA',
      'place_id' => 'ChIJIQBpAG2ahYAR_6128GcTUEo'
    }
    site = SitePoro.new(site_data)

    serialized_site = TourismSiteSerializer.new(site).serializable_hash

    expected_format = {
      data: {
        id: '1',
        type: "tourist_site",
        attributes: {
          name: 'Golden Gate Bridge',
          address: 'San Francisco, CA',
          place_id: 'ChIJIQBpAG2ahYAR_6128GcTUEo'
        }
      }
    }
  end
end

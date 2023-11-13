class GeoService

  def conn
    Faraday.new(
      url: "https://api.geoapify.com", 
      params: {
        apiKey: Rails.application.credentials.geoapify[:api_key],
        categories: "tourism.sights"
      }
    )
  end

  def get_url(link)
    response = conn.get(link)
    JSON.parse(response.body, symbolize_name: true)
  end

  def find_sites(geo_param)
    get_url("/v2/places?filter=circle:#{geo_param},1000")
  end
end

class GeoService

  def conn
    Faraday.new(
      url: "https://api.geoapify.com", 
      params: {
        apiKey: Rails.application.credentials.geoapify[:api_key],
        categories: "accommodation", # required
        filter: "circle:-87.770231,41.878968,5000" # required ## circle:lon,lat,radiusMeters
      }
    )
  end

  def get_url(link)
    response = conn.get(link)
    JSON.parse(response.body, symbolize_name: true)
  end

  def method(query_param)
    get_url("/v2/places?")
  end
end
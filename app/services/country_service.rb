class CountryService
  def conn
    Faraday.new(url: "https://restcountries.com/v3.1/")
  end

  def get_url(link)
    response = conn.get(link)
    JSON.parse(response.body, symbolize_name: true)
  end

  def find_all
    get_url("all")
  end
end
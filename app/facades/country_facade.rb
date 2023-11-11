class CountryFacade
  def random_country
    countries = fetch_countries
    country = countries.sample

    country["name"]["common"]
  end

  def fetch_countries
    all_countries = CountryService.new.find_all
  end
end
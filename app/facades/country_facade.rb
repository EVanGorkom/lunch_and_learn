class CountryFacade
  def random_country
    countries = fetch_countries
    country = countries.sample

    country["name"]["common"]
  end

  def fetch_countries
    all_countries = CountryService.new.find_all
  end

  def find_country(country_name)
    country = CountryService.new.search_country(country_name.downcase)
    if country[0] == nil
      nil
    else
      country[0]["name"]["common"]
    end
  end

  def find_geo_country(country_name)
    country_data = CountryService.new.search_country(country_name)
    if country_data[0] == nil
      nil
    else
      lat_lon_array = country_data[0]["capitalInfo"]["latlng"]
      lat_lon_array[0], lat_lon_array[-1] = lat_lon_array[-1], lat_lon_array[0]
      lon_lat = lat_lon_array.join(',')
    end
  end
end
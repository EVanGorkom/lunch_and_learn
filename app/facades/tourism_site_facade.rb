class TourismSiteFacade

  def find_sites(lon_lat)
    response = GeoService.new.find_sites(lon_lat)

    response["features"].map do |feature|
      SitePoro.new(feature)
    end
  end
end
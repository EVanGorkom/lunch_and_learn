class TourismSiteFacade

  def find_sites(lon_lat)
    response = GeoService.new.find_sites(lon_lat)

    if response["features"] == nil
      []
    else
      response["features"].map do |feature|
        SitePoro.new(feature)
      end
    end
  end
end
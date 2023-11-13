class Api::V1::TourismSitesController < ApplicationController

  def index
    lon_lat = CountryFacade.new.find_geo_country(params[:country])
    tourism_sites = TourismSiteFacade.new.find_sites(lon_lat)

    render json: TourismSiteSerializer.new(tourism_sites)
  end
end
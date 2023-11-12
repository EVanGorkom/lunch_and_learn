class ResourceFacade

  def find_resources(country)
    video = VideoService.new.search_videos(country)
    images = ImageService.new.search_images(country)
    
    ResourcePoro.new(video, images)
  end
end
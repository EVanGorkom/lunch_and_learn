class ResourceFacade

  def find_resources(country)
    json_video = VideoService.new.search_videos(country)
    json_images = ImageService.new.search_images(country)

    video = VideoPoro.new(json_video)
    images = json_images[:results].first(10).map do |image_data|
      ImagePoro.new(image_data)
    end
    ResourcePoro.new(video, images, country)
  end
end
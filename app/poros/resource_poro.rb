class ResourcePoro
  attr_reader :id, :country, :video, :images

  def initialize(video, images, country)
    @id = nil
    @country = country
    @video = video
    @images = images
  end
end
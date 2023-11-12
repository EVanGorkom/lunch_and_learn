class ImagePoro
  attr_reader :alt_tag, :url

  def initialize(json_images)
    @alt_tag = json_images[:alt_description]
    @url = json_images[:urls][:raw]
  end
end
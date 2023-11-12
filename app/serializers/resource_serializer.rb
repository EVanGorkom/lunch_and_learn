class ResourceSerializer
  include JSONAPI::Serializer
  
  set_id :id 
  set_type :learning_resources
  attributes :country

  attribute :video do |object|
    {
      title: object.video.video_title,
      youtube_video_id: object.video.youtube_video_id
    }
  end

  attribute :images do |object|
    object.images.map do |image|
      {
        alt_tag: image.alt_tag,
        url: image.url
      }
    end
  end
end
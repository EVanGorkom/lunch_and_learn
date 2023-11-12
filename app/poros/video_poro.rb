class VideoPoro 
  attr_reader :video_title, :youtube_video_id

  def initialize(json_video)
    @video_title = json_video["items"][0]["snippet"]["title"]
    @youtube_video_id = json_video["items"][0]["id"]["videoId"]
  end
end
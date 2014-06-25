class RedditApi

  def earth_porn
    response = Faraday.get 'http://www.reddit.com/r/EarthPorn.json'
    parsed_response = JSON.parse(response.body)["data"]["children"]
    parsed_response.shift
    formatted_urls = []
    parsed_response.each do |earth_porn_object|
      if is_valid_link?(earth_porn_object["data"]["url"])
        formatted_urls << earth_porn_object
      end
    end
    formatted_urls
  end

  private

  def is_valid_link?(url)
    url.include?(".jpg") || url.include?(".png")
  end
end
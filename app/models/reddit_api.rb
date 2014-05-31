class RedditApi

  def earth_porn
    response = Faraday.get 'http://www.reddit.com/r/EarthPorn.json'
    parsed_response = JSON.parse(response.body)["data"]["children"]
    parsed_response.shift
    parsed_response
  end

end
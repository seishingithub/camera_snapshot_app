class PhotoSelectController < ApplicationController

  def index
    reddit_api = RedditApi.new
    @earth_porn = reddit_api.earth_porn
  end

end
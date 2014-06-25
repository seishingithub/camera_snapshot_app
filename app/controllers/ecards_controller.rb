class EcardsController < ApplicationController

  def index
    @ecards = Ecard.all
  end

  def new
    @ecard = Ecard.new
  end
end



#class PhotoSelectController < ApplicationController
#
#  def index
#    reddit_api = RedditApi.new
#    @earth_porn = reddit_api.earth_porn
#  end
#
#end
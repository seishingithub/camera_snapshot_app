require 'spec_helper'

describe RedditApi do

  it 'should call the reddit api and get the earth porn subreddit' do
    VCR.use_cassette('models/earth_porn') do
      reddit_api = RedditApi.new
      expect(reddit_api.earth_porn[0]["data"]["url"]).to eq 'https://farm4.staticflickr.com/3717/14124500778_37d8ca6867_o.jpg'
    end
  end
  
end
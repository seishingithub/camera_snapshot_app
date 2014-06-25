require 'spec_helper'

describe RedditApi do

  it 'should call the reddit api and get the earth porn subreddit' do
    VCR.use_cassette('models/earth_porn') do
      reddit_api = RedditApi.new
      expect(reddit_api.earth_porn[0]["data"]["url"]).to eq 'https://farm4.staticflickr.com/3717/14124500778_37d8ca6867_o.jpg'
    end
  end

  it 'should return .jpg and .png images (excluding imgur)' do
    VCR.use_cassette('models/earth_porn') do
      reddit_api = RedditApi.new
      response = reddit_api.earth_porn

      image_links = response.collect { |earth_porn_data| earth_porn_data["data"]["url"] }

      image_links.each do |link|
        expect(link.include?(".jpg") || link.include?(".png")).to eq true
      end
    end
  end
end
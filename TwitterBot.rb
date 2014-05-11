require 'twitter'
require_relative 'Tweet'
require_relative 'RESTClientInformation' #private twitter information change to rest_client.rb for your needs.



class TwitterBot
  attr_reader :client,:favoriteTweeters, :tweets,:trends

  def initialize
    @client = Client.new.client
    @favoriteTweeters = ["CNN","kadavy","alexisohanian"]
    @tweets = []
  end


  def update_twitter(text)
    @client.update(text)
  end

  def find_tweets
    @favoriteTweeters.each do |tweeter|
      client.search("from:#{tweeter}",{ :lang =>"en", :result_type => "recent" }).take(10).each do |tweet|
        @tweets << Tweet.new( {:text => tweet.text, :retweet => tweet.retweeted, :favorites => tweet.favorited})
      end
    end
    puts @tweets
  end

  WOE_ID = 23424977  #USA yahoo area ID

  def find_trends
    @trends =@client.trends(WOE_ID,{:exclude => "hashtags"})
    @trends.each do |trend|
      puts trend.name
    end

  end

end

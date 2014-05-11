require 'twitter'
require_relative 'Tweet'



favoriteTweeters = ["CNN","kadavy","alexisohanian"]

array = []
favoriteTweeters.each do |tweeter|

  client.search("from:#{tweeter}",{ :lang =>"en", :result_type => "recent" }).take(10).each do |tweet|
    array << Tweet.new( {:text => tweet.text, :retweet => tweet.retweeted, :favorites => tweet.favorited})

  end

end



puts array

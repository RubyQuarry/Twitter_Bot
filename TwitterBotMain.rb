require_relative 'TwitterBot'
require 'redditkit'




bot = TwitterBot.new

while 1

  paginated_response = RedditKit.front_page

  paginated_response.take(1).each do |link|

    tweet = trailing_periods(link) + message_url(link.url)
    bot.update_twitter(tweet)
    #bot.update_twitter(link.title, link.url.nil? ? " ": link)
  end


  sleep(60*60*4)  #Sleep for 4 hours

end


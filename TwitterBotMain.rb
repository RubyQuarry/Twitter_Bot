require_relative 'TwitterBot'
require 'redditkit'



def message_length link
  link.url.nil? ? 137 :(137 - link.url.length)
end

def trailing_periods link
  if message_length(link) == 137
   link.title[0...message_length(link)]
  else
    link.title[0...message_length(link)]+".."
  end
end


def message_url url
  if url.nil?
    ""
  else
    " "+url
  end
end

bot = TwitterBot.new

while 1

  paginated_response = RedditKit.front_page

  paginated_response.take(1).each do |link|

    tweet = trailing_periods(link) + message_url(link.url)
    bot.update_twitter(tweet)
    #bot.update_twitter(link.title, link.url.nil? ? " ": link)
  end

  sleep(60*60*4)

end


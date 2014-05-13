=begin

=end

class Tweet
  attr_reader :text,:favorites,:retweet


  def initialize(args)
    @text = args.fetch(:text,"no text")
    @favorites = args.fetch(:favorites,"no favorites")
    @rewteet = args.fetch(:retweet,"no retweets")
  end

  def to_s
    "#{@text} favorited: #{@favorites}  retweeted: #{@rewteet}"
  end


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
      " " + url
    end
  end


end


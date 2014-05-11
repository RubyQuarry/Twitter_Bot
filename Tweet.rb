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




end


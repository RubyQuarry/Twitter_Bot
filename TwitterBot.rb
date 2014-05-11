require 'twitter'


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "l3sWtUuWEBVGkC1OrfvnzZCKD"
  config.consumer_secret     = "Xc3FN1O4xmKjNaUauXzhET2uBUbSu1UgjX6wGLhHaQlwEi9gF3"
  config.access_token        = "871206637-ftaH5FEBa2NQlr1rcOxvkDLDq35VdkQMKyS3cfcz"
  config.access_token_secret = "9mJ1T2LVrQ95tdP4HBp3OeWHTnDp01WqbKO5VjAJoqzp0"
end

client.search("from:CNN",{ :lang =>"en", :result_type => "recent" }).take(1).each do |tweet|
  client.update(tweet.text)
end


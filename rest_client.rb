class RESTClient

    attr_reader :client
    def initialize
      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "CONSUMER KEY"
        config.consumer_secret     = "CONSUMER SECRET"
        config.access_token        = "ACCESS TOKEN"
        config.access_token_secret = "TOKEN SECRET"
      end
    end

end
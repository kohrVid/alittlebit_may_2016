class SocialMedia
  def self.twitter_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["twitter_consumer_key"]
      config.consumer_secret = ENV["twitter_consumer_secret"]
      config.access_token = ENV["twitter_access_token"]
      config.access_token_secret = ENV["twitter_access_token_secret"]
    end
  end

  def self.twitter_search(term, number)
    begin
      twitter_client.search(term).take(number)
    rescue Twitter::Error
      ["Unable to connect to Twitter API"]
    end
  end
end

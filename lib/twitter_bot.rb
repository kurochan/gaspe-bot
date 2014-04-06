require 'twitter'
require 'singleton'

class TwitterClient < Twitter::REST::Client
  include Singleton

  def initialize
    super(
      :consumer_key => CONSUMER_KEY,
      :consumer_secret => CONSUMER_SECRET,
      :access_token => ACCESS_TOKEN,
      :access_token_secret => ACCESS_TOKEN_SECRET
    )
  end
end

require 'twitter'
require 'singleton'

class TwitterClient < Twitter::REST::Client
  include Singleton

  def initialize
    super(
      :consumer_key => CONFIG['twitter']['consumer_key'],
      :consumer_secret => CONFIG['twitter']['consumer_secret'],
      :access_token => CONFIG['twitter']['access_token'],
      :access_token_secret => CONFIG['twitter']['access_token_secret']
    )
  end
end

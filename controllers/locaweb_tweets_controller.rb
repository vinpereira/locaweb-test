require_relative "#{Dir.pwd}/services/locaweb_tweets_service.rb"

# Controller class responsible for consume services
class LocawebTweetsController
  def initialize
    @tweets_service = LocawebTweetsService.new
  end

  def most_relevants_tweets
    relevants_tweets = @tweets_service.map_relevants_tweets

    JSON.pretty_generate(relevants_tweets)
  end

  def most_locaweb_mentions
    locaweb_mentions = @tweets_service.group_relevants_tweets

    locaweb_mentions.each do |key, _value|
      locaweb_mentions[key] = @tweets_service.map_relevants_tweets
    end

    JSON.pretty_generate(locaweb_mentions)
  end
end

require_relative "#{Dir.pwd}/services/locaweb_tweets_service.rb"

# Controller class responsible for consume services
class LocawebTweetsController
	URI = URI('http://tweeps.locaweb.com.br/tweeps')

	def initialize
		@tweets_service = LocawebTweetsService.new
	end

	def most_relevants_tweets
		relevants_tweets =  @tweets_service.sort_by_relevance(@tweets_service.relevant_tweets).map { |tweet| @tweets_service.important_fields(tweet) }

		JSON.pretty_generate(relevants_tweets)
	end

	def most_locaweb_mentions
		locaweb_mentions = @tweets_service.sort_by_relevance(@tweets_service.relevant_tweets).group_by do |tweet|
			tweet['user']['screen_name']
		end

		locaweb_mentions.each do |key, value|
			locaweb_mentions[key] = @tweets_service.sort_by_relevance(value).map! { |tweet| @tweets_service.important_fields(tweet) }
		end

		JSON.pretty_generate(locaweb_mentions)
	end
end
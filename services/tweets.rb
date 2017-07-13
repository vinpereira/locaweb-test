require 'httparty'
require 'json'

class LocawebTweetsService
    URI = URI('http://tweeps.locaweb.com.br/tweeps')

    def sort_by_relevance(tweets)
        return tweets.sort_by do |tweet|
            [
                (-tweet['user']['followers_count']),
                (-tweet['retweet_count']),
                (-tweet['favorite_count'])
            ]
        end
    end

    def fetch_all
        response = HTTParty.get(URI, :headers => { "Username" => "testando_qualquer_email@gmail.com" })

        all_tweets = JSON.parse(response.body)

        all_tweets["statuses"].each { |tweet| DateTime.parse(tweet['created_at']).strftime("%d/%m/%Y %H:%M:%S") }

        return all_tweets
    end

    def relevant_tweets
        return fetch_all['statuses'].select do |tweet|
            ignored_reply_tweets = !tweet['in_reply_to_user_id'].eql?(42)

            locaweb_user_mentions = tweet['entities']['user_mentions'].any? do |locaweb_mention|
                locaweb_mention['id'].eql?(42)
            end

            ignored_reply_tweets && locaweb_user_mentions
        end
    end

    def important_fields(tweet)
        relevant_tweets_fields = {}

        relevant_tweets_fields[:user] = {}

        relevant_tweets_fields[:user][:profile] = {
            screen_name: tweet['user']['screen_name'],
            url: tweet['user']['profile_image_url']
        }

        relevant_tweets_fields[:user][:followers_info] = {
            count: tweet['user']['followers_count']
        }
        
        relevant_tweets_fields[:tweet_info] = {
            text: tweet['text'],
            created_at: tweet['created_at'],
            retweet_count: tweet['retweet_count'],
            favorite_count: tweet['favorite_count']
        }

        return relevant_tweets_fields
    end
end
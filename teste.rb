require 'httparty'
require 'json'

class MyTest
    URI = URI('http://tweeps.locaweb.com.br/tweeps')

    def most_relevants
        teste = sort(relevant_tweets).map { |tweet| relevant_fields(tweet) }

        teste.to_json
    end

    def most_mentions
        locaweb_mentions = sort(relevant_tweets).group_by do |tweet|
            tweet['user']['screen_name']
        end

        locaweb_mentions.each do |key, value|
            locaweb_mentions[key] = sort(value).map! { |tweet| relevant_fields(tweet) }
        end

        locaweb_mentions.to_json
    end

    private

    def sort(tweets)
        tweets.sort_by do |tweet|
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

        all_tweets
    end

    def relevant_tweets
        fetch_all['statuses'].select do |tweet|
            ignored_reply_tweets = !tweet['in_reply_to_user_id'].eql?(42)

            locaweb_user_mentions = tweet['entities']['user_mentions'].any? do |locaweb_mention|
                locaweb_mention['id'].eql?(42)
            end

            ignored_reply_tweets && locaweb_user_mentions
        end
    end

    def relevant_fields(tweet)
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

        relevant_tweets_fields
    end
end

my_test = MyTest.new

puts my_test.most_mentions

# File.open("spec/temp.json","w") do |f|
#   f.write(JSON.pretty_generate(my_test.fetch_all))
# end
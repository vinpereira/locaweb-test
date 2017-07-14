require_relative '../controllers/tweets.rb'

require 'sinatra'
require 'sinatra/namespace'

class MyApp < Sinatra::Base
    register Sinatra::Namespace
    
    before do
        content_type :json
        @tweets = LocawebTweetsController.new
    end

    get '/' do
        'Hello World!!'
    end

    namespace '/api/v1' do
        get '/' do
            'Locaweb Test'
        end

        # =begin
        # @api {get} /most_relevants/ Request Tweets information about Locaweb
        # @apiVersion 1.0.0
        # @apiName GetMostRelevants
        # @apiGroup Tweets

        # @apiSuccessExample Success-Response:
        #     HTTP/1.1 200 OK
        #     [
        #         {
        #             "user": {
        #                 "profile": {
        #                     "screen_name": "goldner_rosalyn_mrs",
        #                     "url": "http://a0.twimg.com/profile_images/2359746665/1v6zfgqo8g0d3mk7ii5s_normal.jpeg"
        #                 },
        #                 "followers_info": {
        #                     "count": 971
        #                 }
        #             },
        #             "tweet_info": {
        #                 "text": "I'll index the cross-platform RAM pixel, that should protocol the @locaweb ",
        #                 "created_at": "Mon Sep 24 03:35:21 +0000 2012",
        #                 "retweet_count": 0,
        #                 "favorite_count": 0
        #             }
        #         }
        #     ]
        # =end
        get '/most_relevants' do
            @tweets.most_relevants_tweets
        end

        # =begin
        # @api {get} /most_mentions/ Request Users that has more tweets about Locaweb
        # @apiVersion 1.0.0
        # @apiName GetMostMentions
        # @apiGroup Tweets

        # @apiSuccessExample Success-Response:
        #     HTTP/1.1 200 OK
        #     {
        #         "garnet_koepp": [
        #             {
        #                 "user": {
        #                     "profile": {
        #                         "screen_name": "garnet_koepp",
        #                         "url": "http://a0.twimg.com/profile_images/2359746665/1v6zfgqo8g0d3mk7ii5s_normal.jpeg"
        #                     },
        #                     "followers_info": {
        #                         "count": 901
        #                     }
        #                 },
        #                 "tweet_info": {
        #                     "text": "We need to generate the @locaweb ",
        #                     "created_at": "Mon Sep 24 03:35:21 +0000 2012",
        #                     "retweet_count": 0,
        #                     "favorite_count": 190
        #                 }
        #             }
        #         ]
        #     }
        # =end
        get '/most_mentions' do
            @tweets.most_locaweb_mentions
        end
    end
end

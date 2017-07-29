require_relative "#{Dir.pwd}/controllers/locaweb_tweets_controller.rb"

require 'sinatra'
require 'sinatra/namespace'

# Sinatra Base class where all routes are created
# This class is used at config.ru
class AppRoutes < Sinatra::Base
    register Sinatra::Namespace

    set :public_folder, 'apidoc'
    enable :static

    before do
        content_type :json
        @tweets = LocawebTweetsController.new
    end

    get '/' do
        content_type :html
        File.read(File.join('./apidoc', "index.html"))
    end

    namespace '/api/v1' do
        # =begin
        # @api {get} /api/v1/most_relevants Request Tweets information about Locaweb
        # @apiVersion 1.0.0
        # @apiName GetMostRelevants
        # @apiGroup Tweets
        # @apiDescription see more at <a href="/api/v1/most_relevants">Most Relevants</a>

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
        # =endmost_relevants
        get '/most_relevants' do
            @tweets.most_relevants_tweets
        end

        # =begin
        # @api {get} /api/v1/most_mentions Request Users that has more tweets about Locaweb
        # @apiVersion 1.0.0
        # @apiName GetMostMentions
        # @apiGroup Tweets
        # @apiDescription see more at <a href="/api/v1/most_mentions">Most Mentions</a>

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

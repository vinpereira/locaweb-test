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

        get '/most_relevants' do
            @tweets.most_relevants_tweets
        end

        get '/most_mentions' do
            @tweets.most_locaweb_mentions
        end
    end
end

require_relative "#{Dir.pwd}/controllers/locaweb_tweets_controller.rb"
require 'json'

RSpec.describe 'list tweets about Locaweb' do
  let(:locaweb_tweets) { LocawebTweetsController.new }

  describe 'show the important tweets about Locaweb' do
    context '#most_relevants_tweets' do
      it 'get the most relevants tweets' do
        VCR.use_cassette('most_relevants_tweets') do
          most_relevants_tweets = JSON locaweb_tweets.most_relevants_tweets

          expect(most_relevants_tweets.count).to eq(8)
        end # end-VCR
      end # end-it
    end # end-context

    context '#most_locaweb_mentions' do
      it 'lists users with more mentions about Locaweb' do
        VCR.use_cassette('most_locaweb_mentions') do
          most_locaweb_mentions = JSON locaweb_tweets.most_locaweb_mentions

          expect(most_locaweb_mentions.keys).to eq(
            %w[bergnaum_aiden lakin_carrie hills_janiya crona_tom easter_sipes metz_colten_dvm]
          )
        end # end-VCR
      end # end-it
    end # end-context
  end # end-describe
end # end-RSpec.describe

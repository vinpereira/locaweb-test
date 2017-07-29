require_relative "#{Dir.pwd}/controllers/locaweb_tweets_controller.rb"
require 'rspec'
require 'webmock/rspec'
require 'json'

RSpec.describe 'list tweets about Locaweb' do
	before(:each) do
		@locaweb_tweets = LocawebTweetsController.new

		stub_request(:get, 'http://tweeps.locaweb.com.br/tweeps')
			.with(headers: { 'Username' => 'testando_qualquer_email@gmail.com' })
			.to_return(body: File.open("#{Dir.pwd}/mocks/tweets_mock.json"), status: 200)
	end

	context 'show the important tweets about Locaweb' do
		it 'get the most relevants tweets' do
			most_relevants_tweets = JSON @locaweb_tweets.most_relevants_tweets
			
			expect(most_relevants_tweets.count).to eq(6)
		end

		it 'lists users with more mentions about Locaweb' do
			most_locaweb_mentions = JSON @locaweb_tweets.most_locaweb_mentions
			
			expect(most_locaweb_mentions.keys).to eq([
				'cecilia_dickens', 
				'kuphal_iv_winona', 
				'rowan_feeney', 
				'bethel_lemke', 
				'marcos_walsh', 
				'elda_hilpert'
			])
		end
	end
end
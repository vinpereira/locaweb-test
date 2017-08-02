Given(/^I perform a GET request to "(.*)" endpoint$/) do |endpoint_name|
  @http_api = HTTParty.get("http://localhost:9292/api/v1/#{endpoint_name}")
end

Then(/^I should not get an empty response$/) do
  expect(@http_api.body).to_not be_empty
end

Given(/^I have a mocked data$/) do
  @mock_file = File.open('./mocks/tweets_mock.json').read
end

When(/^I perform a mocked GET request to Locaweb API service$/) do
  @response = stub_request(:get, 'http://tweeps.locaweb.com.br/tweeps')
              .with(headers: { 'Username' => 'testando_qualquer_email@gmail.com' })
              .to_return(body: @mock_file, status: 200)
end

Then(/^I should get the relevants tweets$/) do
  most_relevants_tweets = JSON @locaweb_tweets.most_relevants_tweets

  expect(most_relevants_tweets.count).to eq(6)
end

Then(/^I should get a list with users$/) do
  most_locaweb_mentions = JSON @locaweb_tweets.most_locaweb_mentions

  expect(most_locaweb_mentions.keys).to eq(
    %w[
      cecilia_dickens
      kuphal_iv_winona
      rowan_feeney
      bethel_lemke
      marcos_walsh
      elda_hilpert
    ]
  )
end

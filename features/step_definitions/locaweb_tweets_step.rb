Given(/^I perform a GET request to Locaweb Tweets service$/) do
  @http_api = Faraday.get do |req|
    req.url 'http://tweeps.locaweb.com.br/tweeps'
    req.headers['Username'] = 'testando_qualquer_email@gmail.com'
  end
end

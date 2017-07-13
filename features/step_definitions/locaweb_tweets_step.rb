Given(/^I perform a GET request to Locaweb Tweets service$/) do
  	@http_api = HTTParty.get('http://tweeps.locaweb.com.br/tweeps', :headers => { "Username" => "testando_qualquer_email@gmail.com" })
end

Then(/^I should see the Status Code (\d+)$/) do |status_code|
  expect(@http_api.code).to eq status_code.to_i
end

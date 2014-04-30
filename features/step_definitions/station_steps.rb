Given(/^there is a station$/) do
  create(:station)
end

When(/^I visit the "(.*?)" page$/) do |arg1|
  get '/stations.json', {}, { "Accept" => "application/json" }
end

Then(/^I should see the station$/) do
  expect(last_response.status).to eq 200
  expect(last_response.body).to eq(11)
end

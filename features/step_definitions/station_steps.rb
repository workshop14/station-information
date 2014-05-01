Given(/^there is a station$/) do
  create(:station)
end

When(/^I visit the "(.*?)" page$/) do |arg1|
  get '/stations.json', {}, { "Accept" => "application/json" }
end

Then(/^I should see the station$/) do
  expect(last_response.status).to eq 200
  data = JSON.parse(last_response.body, symbolize_names: true)
  expect(data.first).to include(:name)
end

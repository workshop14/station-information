Given(/^there is a station$/) do
  create(:station)
end

When(/^I visit the "(.*?)" page$/) do |arg1|
  visit '/stations'
end

Then(/^I should see the station$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am on the roof angle page$/) do
  visit '/roof_angle'
  expect(page).to have_content 'Stand square on and point your phone directly at the building'
end

When(/^I happy with my compass position$/) do
  click_on 'Flat'
end

Then(/^I should be able to use app$/) do
  expect(page).to have_content 'Stand nearby and square on to your building and take a photograph!'
end
Given(/^I am on the information page$/) do
  visit '/infopage'
end

When(/^I read information I want to move to next page$/) do
  expect(page).to have_content("Hi, I’m Tom Parker")
  click_link("Next")
end

Then(/^I should see take photo page$/) do
  expect(page).to have_content("Stand square on and point your phone directly at the building.")
end

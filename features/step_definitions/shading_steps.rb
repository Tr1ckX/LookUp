Given(/^I am on shading page$/) do
  visit '/shading'
  expect(page).to have_content("Use the slider to estimate how much shade")
end

When(/^I choose a shade value$/) do
  fill_in "shade_value", with: "1"
  click_on "Next"
end

Then(/^I should see the roof angle page$/) do
  expect(page).to have_content("Summary")
end

Given(/^I am on the shading page$/) do
  visit '/shading'
  page.should have_selector('#shade_info', visible: false)
end

Given(/^I need more information$/) do
  click_on 'shade_button'
  page.should have_selector('#shade_info', visible: true)
end

Then(/^I should see Tom's information about shading impact$/) do
  expect(page).to have_content("Shading can make all the difference to a roof’s potential")
end

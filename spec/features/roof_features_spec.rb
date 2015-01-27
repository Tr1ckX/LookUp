require 'spec_helper'

feature "Results" do
  
  scenario "view results for flat roofs" do
    visit '/'
    click_on 'Get started!'
    Roof.first.update(roof_angle: 0, gutter_edge: 20, angled_edge: 10, shade_value: 20)
    visit '/result'
    expect(page).to have_content("Estimated Solar Panel Capacity: 62")
    expect(page).to have_content("Estimated Output Power: 15500")
  end

  scenario "view results for sloped roofs" do
    visit '/'
    click_on 'Get started!'
    Roof.first.update(roof_angle: 10, gutter_edge: 20, angled_edge: 10, shade_value: 20)
    visit '/result'
    expect(page).to have_content("Estimated Solar Panel Capacity: 100")
    expect(page).to have_content("Estimated Output Power: 25000")
  end

end
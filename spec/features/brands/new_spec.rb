require "rails_helper"

RSpec.describe 'Brand new' do
  before :each do
    visit("/brands/new")
  end

  it 'can create a brand' do
    fill_in "brand[brand_name]", with: "Suckboy"
    fill_in "brand[established]", with: "100"
    fill_in "brand[gnarly]", with: "false"

    expect(page).to have_button("Submit")

    click_on "Submit"

    expect(page).to have_content("Suckboy")
    expect(page).to have_content("100")
    expect(page).to have_content("false")
  end

  it 'redirects to the index page' do
    click_on "Submit"

    expect(current_path).to eq("/brands")
  end
end

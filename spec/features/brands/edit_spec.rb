require "rails_helper"

RSpec.describe 'Brand Edit' do
  before :each do
    @brand = Brand.create!({
      brand_name: "dogtown",
      established: 2000,
      gnarly: true
      })

    visit("/brands/#{@brand.id}/edit")
  end

  it 'can change existing brand' do
    fill_in "brand[brand_name]", with: "Suckboy"
    fill_in "brand[established]", with: "100"
    fill_in "brand[gnarly]", with: "false"

    expect(page).to have_button("Submit")

    click_on "Submit"

    expect(page).to have_content("Suckboy")
    expect(page).to have_content("100")
    expect(page).to have_content("false")
  end

  it 'redirects to the show page' do
    click_on "Submit"

    expect(current_path).to eq("/brands/#{@brand.id}")
  end

  it 'has a link to the all the brands and all skateboards' do
    click_on "Skateboards"
    expect(current_path).to eq("/skateboards")
    click_on "Brands"
    expect(current_path).to eq("/brands")
  end
end

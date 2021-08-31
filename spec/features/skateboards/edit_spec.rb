require "rails_helper"

RSpec.describe 'Skateboard Edit' do
  before :each do
    @brand = Brand.create!({
      brand_name: "dogtown",
      established: 2000,
      gnarly: true
      })

    @skateboard = Skateboard.create!({
      board_name: "dogtown",
      cost: 20.00,
      nose: true,
      brand_id: @brand.id
      })

    visit("/skateboards/#{@skateboard.id}/edit")
  end

  it 'can change existing skateboard' do
    fill_in "skateboard[board_name]", with: "Sucker"
    fill_in "skateboard[cost]", with: "40.00"
    fill_in "skateboard[nose]", with: "true"
    fill_in "skateboard[brand_id]", with: "#{@brand.id}"

    expect(page).to have_button("Submit")

    click_on "Submit"

    expect(page).to have_content("Sucker")
    expect(page).to have_content("40.0")
    expect(page).to have_content("true")
  end

  it 'redirects to the show page' do
    click_on "Submit"

    expect(current_path).to eq("/skateboards/#{@skateboard.id}")
  end

  it 'has a link to the all the brands and all skateboards' do
    click_on "Skateboards"
    expect(current_path).to eq("/skateboards")
    click_on "Brands"
    expect(current_path).to eq("/brands")
  end
end

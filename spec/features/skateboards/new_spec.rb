require "rails_helper"

RSpec.describe 'Skateboard New' do
  before :each do
    @brand = Brand.create!({
      brand_name: "dogtown",
      established: 2000,
      gnarly: true
      })

    visit("/skateboards/new")
  end

  it 'can create a skateboard' do
    fill_in "skateboard[board_name]", with: "Suckboy"
    fill_in "skateboard[cost]", with: "100"
    fill_in "skateboard[nose]", with: "true"
    fill_in "skateboard[brand_id]", with: "#{@brand.id}"

    expect(page).to have_button("Submit")

    click_on "Submit"

    expect(page).to have_content("Suckboy")
    expect(page).to have_content("100")
    expect(page).to have_content("true")
  end

  it 'redirects to the index page' do
    click_on "Submit"

    expect(current_path).to eq("/skateboards")
  end

  it 'has a link to the all the brands and all skateboards' do
    click_on "Skateboards"
    expect(current_path).to eq("/skateboards")
    click_on "Brands"
    expect(current_path).to eq("/brands")
  end
end

require "rails_helper"

RSpec.describe 'Skateboard show' do
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

    visit("/skateboards/#{@skateboard.id}")
  end

  it 'can display skateboard names' do
    expect(page).to have_content(@skateboard.board_name)
  end

  it 'can display cost' do
    expect(page).to have_content(@skateboard.cost)
  end

  it 'can display if the board has a nose or not' do
    expect(page).to have_content(@skateboard.nose)
  end

  it 'has a link to the all the brands and all skateboards' do
    click_on "Skateboards"
    expect(current_path).to eq("/skateboards")
    click_on "Brands"
    expect(current_path).to eq("/brands")
  end
end

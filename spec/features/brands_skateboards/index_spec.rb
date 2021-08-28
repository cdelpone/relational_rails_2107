require "rails_helper"

RSpec.describe 'can dispay a brand with its skateboards' do
  before :each do
    @brand = Brand.create!({
      brand_name: "dogtown",
      established: 2000,
      gnarly: true
      })
    @skateboard_1 = Skateboard.create!({
      board_name: "Dogtown",
      cost: 20.00,
      nose: true,
      brand_id: @brand.id
      })
    @skateboard_2 = Skateboard.create!({
      board_name: "Birdhouse",
      cost: 40.00,
      nose: false,
      brand_id: @brand.id
      })

    visit("/brands/#{@brand.id}/skateboards")
  end

  it 'can display board name' do
    expect(page).to have_content(@skateboard_1.board_name)
    expect(page).to have_content(@skateboard_2.board_name)
  end

  it 'can display cost' do
    expect(page).to have_content(@skateboard_1.cost)
    expect(page).to have_content(@skateboard_2.cost)
  end

  it 'can display if the board has nose or not' do
    expect(page).to have_content(@skateboard_1.nose)
    expect(page).to have_content(@skateboard_2.nose)
  end

  it 'has a button to orginize in alphabetical order' do
    expect(page).to have_button("A-Z")

    click_button("A-Z")

    expect(current_path).to eq("/brands/#{@brand.id}/skateboards")
    expect("Birdhouse").to appear_before("Dogtown")
  end

end

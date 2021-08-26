require "rails_helper"

RSpec.describe 'can dispay an index with options' do
  before :each do
    @brand = Brand.create!({
      brand_name: "dogtown",
      established: 2000,
      gnarly: true
      })
    @skateboard_1 = Skateboard.create!({
      board_name: "dogtown",
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

    visit('/skateboards')
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

end

require "rails_helper"

RSpec.describe 'can dispay a brand with its skateboards' do
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

  it 'can display brand names' do
    expect(page).to have_content(@brand.brand_name)
  end

  it 'can display years established' do
    expect(page).to have_content(@brand.established)
  end

  it 'can display if the company is gnarly or not' do
    expect(page).to have_content(@brand.gnarly)
  end

end

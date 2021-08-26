require "rails_helper"

RSpec.describe 'can dispay skateboard with its attributes' do
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

end

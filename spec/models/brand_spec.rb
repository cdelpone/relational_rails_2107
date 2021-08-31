require "rails_helper"

RSpec.describe Brand do
  it {should have_many :skateboards}

  before :each do
    @brand_1 = Brand.create!({
      brand_name: "dogtown",
      established: 2000,
      gnarly: true
      })
    @brand_2 = Brand.create!({
      brand_name: "Birdhouse",
      established: 1999,
      gnarly: false
      })
    @brand_3 = Brand.create!({
      brand_name: "Deathwish",
      established: 2004,
      gnarly: true
    })
    @skateboard_1 = Skateboard.create!({
      board_name: "Dogtown",
      cost: 20.00,
      nose: true,
      brand_id: @brand_1.id
      })
    @skateboard_2 = Skateboard.create!({
      board_name: "Birdhouse",
      cost: 40.00,
      nose: false,
      brand_id: @brand_1.id
      })
  end

  it 'can order the list of skateboards' do
    expect(Brand.order_by_creation).to eq([@brand_3, @brand_2, @brand_1])
  end

  it 'can give the num of skateboards' do
    expect(@brand_1.num_of_skateboards).to eq(2)
  end

  it 'can order the skateboards by board name alphabetically' do
    expect(@brand_1.alphabetize_boards).to eq([@skateboard_2, @skateboard_1])
  end
end

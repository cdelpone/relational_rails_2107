require "rails_helper"

RSpec.describe Skateboard do
  before :each do
    @brand = Brand.create!({
      brand_name: "dogtown",
      established: 2000,
      gnarly: true
      })
    @skateboard_1 = Skateboard.create!({
      board_name: "dogtown",
      cost: 10.00,
      nose: true,
      brand_id: @brand.id
      })
    @skateboard_2 = Skateboard.create!({
      board_name: "Birdhouse",
      cost: 40.00,
      nose: true,
      brand_id: @brand.id
      })
    @skateboard_3 = Skateboard.create!({
      board_name: "Chicken",
      cost: 30.00,
      nose: false,
      brand_id: @brand.id
      })
  end

  it 'can filter the skateboards by whether or no they have a nose' do
    expect(Skateboard.nose_filter).to eq([@skateboard_1, @skateboard_2])
  end
end

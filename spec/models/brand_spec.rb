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
  end

  it 'can order the list of skateboards' do
    expect(Brand.order_by_creation).to eq([@brand_3, @brand_2, @brand_1])
  end
end

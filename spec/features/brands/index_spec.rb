require "rails_helper"

RSpec.describe 'can dispay an index with options' do
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

    visit('/brands')
  end

  it 'can display brand names' do
    expect(page).to have_content(@brand_1.brand_name)
    expect(page).to have_content(@brand_2.brand_name)
  end

  it 'can display years established' do
    expect(page).to have_content(@brand_1.established)
    expect(page).to have_content(@brand_2.established)
  end

  it 'can display if the company is gnarly or not' do
    expect(page).to have_content(@brand_1.gnarly)
    expect(page).to have_content(@brand_2.gnarly)
  end
end

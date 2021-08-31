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
    @brand_3 = Brand.create!({
      brand_name: "Deathwish",
      established: 2004,
      gnarly: true
      })

    visit('/brands')
  end

  it 'can display brand names' do
    expect(page).to have_content(@brand_1.brand_name)
    expect(page).to have_content(@brand_2.brand_name) # test all
  end

  it 'can display years established' do
    expect(page).to have_content(@brand_1.established)
    expect(page).to have_content(@brand_2.established)
  end

  it 'can display if the company is gnarly or not' do
    expect(page).to have_content(@brand_1.gnarly)
    expect(page).to have_content(@brand_2.gnarly)
  end

  it 'can display the date entered into the app' do
    expect(page).to have_content(@brand_1.created_at)
    expect(page).to have_content(@brand_2.created_at)
  end

  it 'can display the brands in order of creation' do
    expect("Deathwish").to appear_before("Birdhouse", only_text: true)
    expect("Birdhouse").to appear_before("dogtown", only_text: true)
  end

  it 'has a link to the all the brands and all skateboards' do
    click_on "Skateboards"
    expect(current_path).to eq("/skateboards")
    click_on "Brands"
    expect(current_path).to eq("/brands")
  end
end

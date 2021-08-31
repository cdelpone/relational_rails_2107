require "rails_helper"

RSpec.describe 'Brand show' do
  before :each do
    @brand = Brand.create!({
      brand_name: "dogtown",
      established: 2000,
      gnarly: true
      })

    visit("/brands/#{@brand.id}")
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

  it 'has a link to the brands skateboards' do
    click_button "#{@brand.brand_name} Skateboards"
  end

  it 'has a link to the all the brands and all skateboards' do
    click_on "Skateboards"
    expect(current_path).to eq("/skateboards")
    click_on "Brands"
    expect(current_path).to eq("/brands")
  end
end

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

end

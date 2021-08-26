require "rails_helper"

RSpec.describe 'can dispay brand with its attributes' do
  before :each do
    @brand_1 = Brand.create!({
      brand_name: "dogtown",
      established: 2000,
      gnarly: true
      })

    visit("/brands/#{@brand_1.id}")
  end

  it 'can display brand names' do
    expect(page).to have_content(@brand_1.brand_name)
  end

  it 'can display years established' do
    expect(page).to have_content(@brand_1.established)
  end

  it 'can display if the company is gnarly or not' do
    expect(page).to have_content(@brand_1.gnarly)
  end

end

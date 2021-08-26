# As a visitor
# when I visit a distilleries scotches index
# then I see the names of all the distilleries scotches
# and I see each name is a link to the scotches show page

require 'rails_helper'

RSpec.describe 'Distilleries scotches index' do
  it 'shows all the names of the scotches for the distillery' do
    besto = Distillery.create!(name: 'Pesto the Besto', established: 2020, scotland_location: false)
    pesto = pesto.scotches.create!(name: 'Pesto', year: 1, single_malt: true)

    visit "/distilleries/#{pesto.id}/scotches"

    expect(page).to have_content(pesto.name)
  end

  it 'links to each songs show page' do

  end
end

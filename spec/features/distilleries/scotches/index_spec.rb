require 'rails_helper'
# User Story 5, Parent Children Index (x2)
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:
# from setlist tutorial:
    # As a visitor
    # when I visit a distillery scotches index
    # then I see the names of all the distilleries scotches
    # and I see each name is a link to the scotches show page

RSpec.describe 'Distillery scotches index' do
  before :each do
    @distillery_1 = Distillery.create!({
                                    name: "Ardbeg",
                                    established: 1815,
                                    scotland_location: true,
                                    id: 1
                                    })
    @distillery_7 = Distillery.create!({
                                    name: "Bowmore",
                                    established: 1779,
                                    scotland_location: true,
                                    id: 7
                                    })
    @scotch_1 = Scotch.create!({
                                    name: "An OA",
                                    single_malt: true,
                                    year: 15,
                                    updated_at: '2021-08-26 18:00:40 UTC',
                                    created_at: '2021-08-26 18:00:40 UTC',
                                    distillery_id: 1,
                                    id: 1
                                    })
    @scotch_2 = Scotch.create!({
                                    name: "Bowmore 10 yr",
                                    single_malt: true,
                                    year: 10,
                                    updated_at: '2021-08-26 20:10:37 UTC',
                                    created_at: '2021-08-26 20:10:37 UTC',
                                    distillery_id: 7,
                                    id: 2
                                    })
    @scotch_3 = Scotch.create!({
                                    name: "Bowmore 12 yr",
                                    single_malt: false,
                                    year: 12,
                                    updated_at: '2021-08-26 21:34:25 UTC',
                                    created_at: '2021-08-26 21:34:25 UTC',
                                    distillery_id: 7,
                                    id: 3
                                    })
  end

  it 'shows all the names of the scotches for the distillery' do
    visit "/distilleries/#{@distillery_7.id}/scotches"

    expect(page).to have_content(@scotch_2.name)
    expect(page).to have_content(@scotch_2.single_malt)
    expect(page).to have_content(@scotch_2.year)
    expect(page).to have_content(@scotch_2.distillery_id)
    expect(page).to have_content(@scotch_2.updated_at)
    expect(page).to have_content(@scotch_2.created_at)
  end

  it 'links to each scotches show page' do
  end
  it 'links to each scotches edit page' do
  end
  it 'deletes each scotch' do
  end
  it 'returns to the parent homepage' do
  end
end

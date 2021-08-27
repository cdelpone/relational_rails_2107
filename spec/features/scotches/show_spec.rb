# User Story 4, Child Show (x2)
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:
require 'rails_helper'

RSpec.describe 'scotch show page', type: :feature do
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

  describe 'only displays the name and attributes of the scotch selected' do

    it 'only displays the name of the scotch selected' do
      visit '/scotches/1'
      expect(page).to have_content(@scotch_1.name)
      expect(page).to have_no_content(@scotch_3.name)
      visit '/scotches/3'
      expect(page).to have_content(@scotch_3.name)
      expect(page).to have_no_content(@scotch_1.name)
    end

    it 'only displays the year of the scotch selected' do
      visit '/scotches/2'
      expect(page).to have_content(@scotch_2.year)
      expect(page).to have_no_content(@scotch_1.year)
      visit '/scotches/1'
      expect(page).to have_content(@scotch_1.year)
      expect(page).to have_no_content(@scotch_2.year)
    end

    it 'only displays if the scotch is single malt or not for the scotch selected' do
      visit '/scotches/3'
      expect(page).to have_content(@scotch_3.single_malt)
      expect(page).to have_no_content(@scotch_2.single_malt)
      visit '/scotches/2'
      expect(page).to have_content(@scotch_2.single_malt)
      expect(page).to have_no_content(@scotch_3.single_malt)
    end

    it 'only displays the date the scotch record was created for the scotch selected' do
      visit '/scotches/1'
      expect(page).to have_content(@scotch_1.created_at)
      expect(page).to have_no_content(@scotch_2.created_at)
      visit '/scotches/2'
      expect(page).to have_content(@scotch_2.created_at)
      expect(page).to have_no_content(@scotch_1.created_at)
    end

    it 'only displays the date the scotch record was updated for the scotch selected' do
      visit '/scotches/2'
      expect(page).to have_content(@scotch_2.updated_at)
      expect(page).to have_no_content(@scotch_3.updated_at)
      visit '/scotches/3'
      expect(page).to have_content(@scotch_3.updated_at)
      expect(page).to have_no_content(@scotch_2.updated_at)
    end
  end
end

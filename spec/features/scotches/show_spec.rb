require 'rails_helper'
# rspec spec/features/scotches/show_spec.rb
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
    @distillery_6 = Distillery.create!({
                                    name: "Laphroaig",
                                    established: 1815,
                                    scotland_location: true,
                                    updated_at: '2021-08-26 00:06:30 UTC',
                                    created_at: '2021-08-26 00:06:30 UTC',
                                    id: 6
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
                                    single_malt: true,
                                    year: 12,
                                    updated_at: '2021-08-26 21:34:25 UTC',
                                    created_at: '2021-08-26 21:34:25 UTC',
                                    distillery_id: 7,
                                    id: 3
                                    })
  end

  describe 'only displays the name and attributes of the scotch selected' do
    # User Story 4, Child Show (x2)
    # As a visitor; # When I visit '/child_table_name/:id'; # Then I see the child with that id including the child's attributes:
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
      visit '/scotches/2'
      expect(page).to have_content(@scotch_2.single_malt)
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

  describe 'has links on the show page for the scotch selected' do
    before :each do
      visit '/scotches/2'
    end
    it 'links to the distillery index page(interactivity)' do
      # User Story 9, Parent Index Link; # As a visitor; # When I visit any page on the site; # Then I see a link at the top of the page that takes me to the Parent Index
      expect(page).to have_link('Distilleries')
      click_link 'Distilleries'
      expect(current_path).to eq("/distilleries")
      expect(page).to have_content(@distillery_6.name)
    end

    it 'links to the scotches index page(interactivity)' do
      # User Story 8, Child Index Link; # As a visitor; # When I visit any page on the site; # Then I see a link at the top of the page that takes me to the Child Index
      expect(page).to have_link('Scotches')
      click_link 'Scotches'
      expect(current_path).to eq("/scotches")
      expect(page).to have_content(@scotch_1.name)
      expect(page).to have_content(@scotch_2.name)
      expect(page).to have_content(@scotch_3.name)
    end

    it 'has a link to update a scotch' do
      # User Story 14, Child Update (x2)
      # As a visitor; # When I visit a Child Show page; # Then I see a link to update that Child "Update Child"; # When I click the link; # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:; # When I click the button to submit the form "Update Child"; # Then a `PATCH` request is sent to '/child_table_name/:id',; # the child's data is updated,; # and I am redirected to the Child Show page where I see the Child's updated information
      expect(page).to have_link('Update')
      click_link 'Update'
      expect(current_path).to eq('/scotches/2/edit')
      expect(page).to have_content(@scotch_2.name)
      expect(page).to have_button('Update')
      click_button 'Update'
    end

    it 'deletes scotch with a button' do
      # User Story 20, Child Delete (x2)
      # As a visitor; # When I visit a child show page; # Then I see a link to delete the child "Delete Child"; # When I click the link; # Then a 'DELETE' request is sent to '/child_table_name/:id',; # the child is deleted,; # and I am redirected to the child index page where I no longer see this child
      visit '/scotches/1'
      expect(page).to have_link('Delete')
      click_link 'Delete'
      expect(current_path).to eq('/scotches')
      expect(page).to have_no_content(@scotch_1.name)
    end
  end
end

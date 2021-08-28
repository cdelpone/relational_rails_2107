require 'rails_helper'
# rspec spec/features/distilleries/show_spec.rb
RSpec.describe 'distillery show page', type: :feature do
  before :each do
    @distillery_6 = Distillery.create!({
                                    name: "Laphroaig",
                                    established: 1815,
                                    scotland_location: true,
                                    updated_at: '2021-08-26 00:06:30 UTC',
                                    created_at: '2021-08-26 00:06:30 UTC',
                                    id: 6
                                    })
    @distillery_1 = Distillery.create!({
                                    name: "Ardbeg",
                                    established: 1815,
                                    scotland_location: true,
                                    updated_at: '2021-08-26 01:20:17 UTC',
                                    created_at: '2021-08-25 16:34:12 UTC',
                                    id: 1
                                    })
    @distillery_7 = Distillery.create!({
                                    name: "Bowmore",
                                    established: 1779,
                                    scotland_location: false,
                                    updated_at: '2021-08-26 01:11:07 UTC',
                                    created_at: '2021-08-26 01:11:07 UTC',
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

  describe 'only displays the name and attributes of the distillery selected' do
    # User Story 2, Parent Show (x2)
    # As a visitor; # When I visit '/parents/:id'; # Then I see the parent with that id including the parent's attributes:;# - data from each column that is on the parent table
    it 'only displays the name of the distillery selected' do
      visit '/distilleries/6'
      expect(page).to have_content(@distillery_6.name)
      expect(page).to have_no_content(@distillery_1.name)
      visit '/distilleries/1'
      expect(page).to have_content(@distillery_1.name)
      expect(page).to have_no_content(@distillery_6.name)
    end

    it 'only displays the year established of the distillery selected' do
      visit '/distilleries/7'
      expect(page).to have_content(@distillery_7.established)
      expect(page).to have_no_content(@distillery_1.established)
      visit '/distilleries/6'
      expect(page).to have_content(@distillery_6.established)
      expect(page).to have_no_content(@distillery_7.established)
    end

    it 'only displays if the distillery is located in scotland or not for the distillery selected' do
      visit '/distilleries/1'
      expect(page).to have_content(@distillery_1.scotland_location)
      expect(page).to have_no_content(@distillery_7.scotland_location)
      visit '/distilleries/7'
      expect(page).to have_content(@distillery_7.scotland_location)
      expect(page).to have_no_content(@distillery_1.scotland_location)
    end

    it 'only displays the date the distillery record was created for the distillery selected' do
      visit '/distilleries/6'
      expect(page).to have_content(@distillery_6.created_at)
      expect(page).to have_no_content(@distillery_1.created_at)
      visit '/distilleries/1'
      expect(page).to have_content(@distillery_1.created_at)
      expect(page).to have_no_content(@distillery_6.created_at)
    end

    it 'only displays the date the distillery record was updated for the distillery selected' do
      visit '/distilleries/7'
      expect(page).to have_content(@distillery_7.updated_at)
      expect(page).to have_no_content(@distillery_6.updated_at)
      visit '/distilleries/6'
      expect(page).to have_content(@distillery_6.updated_at)
      expect(page).to have_no_content(@distillery_7.updated_at)
    end
  end

  describe 'does other things on the show page for the distillery selected' do
    it 'displays the number of scotches (child records) the distillery has' do
      # User Story 7, Parent Child Count (x2)
      # As a visitor; # When I visit a parent's show page; # I see a count of the number of children associated with this parent
      visit '/distilleries/7'
      expect(page).to have_content(@distillery_7.count_scotches)
    end
  end

  describe 'has links on the show page for the distillery selected' do
    it 'links to the distilleries scotches index page' do
      # User Story 10, Parent Child Index Link; # As a visitor; # When I visit a parent show page ('/parents/:id'); # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')
      visit '/distilleries/7'
      expect(page).to have_link('All Scotches from this distillery.')
      click_link 'All Scotches from this distillery.'
      expect(current_path).to eq("/distilleries/#{@distillery_7.id}/scotches/")
      expect(page).to have_content(@scotch_2.name)
      expect(page).to have_content(@scotch_3.name)
    end

    it 'links to the distillery index page(interactivity)' do
      # User Story 9, Parent Index Link; # As a visitor; # When I visit any page on the site; # Then I see a link at the top of the page that takes me to the Parent Index
      visit '/distilleries/7'
      expect(page).to have_link('Distilleries')
      click_link 'Distilleries'
      expect(current_path).to eq("/distilleries")
      expect(page).to have_content(@distillery_6.name)
    end

    it 'links to the scotches index page(interactivity)' do
      # User Story 9, Parent Index Link; # As a visitor; # When I visit any page on the site; # Then I see a link at the top of the page that takes me to the Parent Index
      visit '/distilleries/7'
      expect(page).to have_link('Scotches')
      click_link 'Scotches'
      expect(current_path).to eq("/scotches")
      expect(page).to have_content(@scotch_1.name)
      expect(page).to have_content(@scotch_2.name)
      expect(page).to have_content(@scotch_3.name)
    end

    it 'links to the distilleries update/edit page' do
    # User Story 12, Parent Update (x2)
    # As a visitor; # When I visit a parent show page; # Then I see a link to update the parent "Update Parent"; # When I click the link "Update Parent"; # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:; # When I fill out the form with updated information; # And I click the button to submit the form; # Then a `PATCH` request is sent to '/parents/:id',; # the parent's info is updated,; # and I am redirected to the Parent's Show page where I see the parent's updated info
      visit '/distilleries/7'
      expect(page).to have_link('Update')
      click_link 'Update'
      expect(current_path).to eq('/distilleries/7/edit')
    end
  end

    it 'deletes distillery with a button' do
    end

end

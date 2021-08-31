require 'rails_helper'
# rspec spec/features/scotches/index_spec.rb
RSpec.describe 'scotches index page', type: :feature do
  describe 'displays' do
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
                                      single_malt: true,
                                      year: 12,
                                      updated_at: '2021-08-26 21:34:25 UTC',
                                      created_at: '2021-08-26 21:34:25 UTC',
                                      distillery_id: 7,
                                      id: 3
                                      })
      visit '/scotches'
    end

    it 'can see the names and attributes of all scotches' do
      # User Story 3, Child Index (x2)
      # As a visitor; # When I visit '/child_table_name'; # Then I see each Child in the system including the Child's attributes:
      expect(page).to have_content(@scotch_1.name)
      expect(page).to have_content(@scotch_1.year)
      expect(page).to have_content(@scotch_1.single_malt)
      expect(page).to have_content(@scotch_1.created_at)
      expect(page).to have_content(@scotch_1.updated_at)
      expect(page).to have_content(@scotch_1.distillery_id)

      expect(page).to have_content(@scotch_2.name)
      expect(page).to have_content(@scotch_2.year)
      expect(page).to have_content(@scotch_2.single_malt)
      expect(page).to have_content(@scotch_2.created_at)
      expect(page).to have_content(@scotch_2.updated_at)
      expect(page).to have_content(@scotch_2.distillery_id)

      expect(page).to have_content(@scotch_3.name)
      expect(page).to have_content(@scotch_3.year)
      expect(page).to have_content(@scotch_3.single_malt)
      expect(page).to have_content(@scotch_3.created_at)
      expect(page).to have_content(@scotch_3.updated_at)
      expect(page).to have_content(@scotch_3.distillery_id)
    end

    it 'links to the distillery index page' do
      # User Story 9, Parent Index Link
      # As a visitor; # When I visit any page on the site; # Then I see a link at the top of the page that takes me to the Parent Index
      expect(page).to have_link('Distilleries')
      click_link 'Distilleries'
      expect(current_path).to eq("/distilleries")
    end

    it 'links to the scotches index page' do
      # User Story 8, Child Index Link; # As a visitor; # When I visit any page on the site; # Then I see a link at the top of the page that takes me to the Child Index
      expect(page).to have_link('Scotches')
      click_link 'Scotches'
      expect(current_path).to eq("/scotches")
    end
  end

  describe 'true values' do
    before :each do
      @distillery_1 = Distillery.create!({
                                      name: "Ardbeg",
                                      established: 1815,
                                      scotland_location: true,
                                      id: 1
                                      })
      # scotch_1 = Scotch.create!({
      #                                 name: "An OA",
      #                                 single_malt: false,
      #                                 year: 15,
      #                                 updated_at: '2021-08-26 18:00:40 UTC',
      #                                 created_at: '2021-08-26 18:00:40 UTC',
      #                                 distillery_id: 1,
      #                                 id: 1
      #                                 })
      @scotch_5 = Scotch.create!({
                                      name: "Bowmore 18 yr",
                                      single_malt: true,
                                      year: 10,
                                      updated_at: '2021-08-26 20:10:37 UTC',
                                      created_at: '2021-08-26 20:10:37 UTC',
                                      distillery_id: 1,
                                      id: 5
                                      })
      @scotch_6 = Scotch.create!({
                                      name: "Ardbeg 10 yr",
                                      single_malt: true,
                                      year: 10,
                                      updated_at: '2021-08-26 21:34:25 UTC',
                                      created_at: '2021-08-26 21:34:25 UTC',
                                      distillery_id: 1,
                                      id: 6
                                      })
      visit '/scotches'
    end

    it 'only shows records where the value for single_malt is true' do
      # User Story 15, Child Index only shows `true` Records (x2); # As a visitor; # When I visit the child index; # Then I only see records where the boolean column is `true`
      # expect(page).to have_no_content(@scotch_1.name)
      expect(page).to have_content(@scotch_5.name)
      expect(page).to have_content(@scotch_6.name)
      expect(page).to have_content(true)
      expect(page).to have_no_content(false)
    end
  end

  describe 'each scotch links' do
    before :each do
      @distillery_1 = Distillery.create!({
                                      name: "Ardbeg",
                                      established: 1815,
                                      scotland_location: true,
                                      id: 1
                                      })
      @scotch_5 = Scotch.create!({
                                      name: "Bowmore 18 yr",
                                      single_malt: true,
                                      year: 10,
                                      updated_at: '2021-08-26 20:10:37 UTC',
                                      created_at: '2021-08-26 20:10:37 UTC',
                                      distillery_id: 1,
                                      id: 5
                                      })
      visit '/scotches'
    end

    it "has a link to edit page" do
      # User Story 18, Child Update From Childs Index Page (x1)
      # As a visitor; # When I visit the `child_table_name` index page or a parent `child_table_name` index page; # Next to every child, I see a link to edit that child's info; # When I click the link; # I should be taken to that `child_table_name` edit page where I can update its information just like in User Story 11
      expect(page).to have_link('Update')

      click_link 'Update'

      expect(current_path).to eq("/scotches/#{@scotch_5.id}/edit")
      expect(page).to have_content(@scotch_5.name)
    end

    it 'button to delete scotch' do
      # User Story 23, Child Delete From Childs Index Page (x1)
      # As a visitor; # When I visit the `child_table_name` index page or a parent `child_table_name` index page; # Next to every child, I see a link to delete that child; # When I click the link; # I should be taken to the `child_table_name` index page where I no longer see that child
      expect(page).to have_button('Delete')

      click_button 'Delete'

      expect(current_path).to eq('/scotches')
      expect(page).to have_no_content(@scotch_5.name)
    end
  end
end

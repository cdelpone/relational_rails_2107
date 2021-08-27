# User Story 2, Parent Show (x2)
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table
require 'rails_helper'

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
  end

  describe 'only displays the name and attributes of the distillery selected' do

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
end

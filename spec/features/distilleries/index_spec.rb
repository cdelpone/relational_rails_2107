# User Story 1, Parent Index (x2)
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
require 'rails_helper'

RSpec.describe 'distilleries index page', type: :feature do
  before :each do
    @distillery_6 = Distillery.create!({
                                    name: "Laphroaig",
                                    established: 1815,
                                    scotland_location: true,
                                    id: 6
                                    })
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

    visit '/distilleries'
  end

  it 'can see the names of all distilleries' do
    expect(page).to have_content(@distillery_6.name)
    expect(page).to have_content(@distillery_1.name)
    expect(page).to have_content(@distillery_7.name)
  end
end

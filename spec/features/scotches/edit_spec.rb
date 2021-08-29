require 'rails_helper'
# rspec spec/features/scotches/edit_spec.rb
RSpec.describe 'scotch update page', type: :feature do
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
                                    scotland_location: 'true',
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
    visit '/scotches/2/edit'
  end

  it 'only shows editable fields for the scotch selected' do
    # User Story 12, Parent Update (x2); # As a visitor; # When I visit a parent show page; # Then I see a link to update the parent "Update Parent"; # When I click the link "Update Parent"; # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:; # When I fill out the form with updated information; # And I click the button to submit the form; # Then a `PATCH` request is sent to '/parents/:id',; # the parent's info is updated,; # and I am redirected to the Parent's Show page where I see the parent's updated info
    expect(current_path).to eq('/scotches/2/edit')
    expect(page).to have_content('Edit Bowmore 10 yr')
    # expect(page).to have_content('1779')
    expect(page).to have_no_content('Edit An OA')
    # select 'disillery[scotland_location]'
    fill_in 'scotch[year]', with: '5'

    expect(page).to have_button('Submit')

    click_button 'Submit'

    expect(current_path).to eq('/scotches/2')
    expect(page).to have_content('Bowmore 10 yr')
    expect(page).to have_content('5')
    expect(page).to have_no_content('An OA')
  end
end

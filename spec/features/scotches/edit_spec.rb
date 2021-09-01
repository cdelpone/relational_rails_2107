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
                                    single_malt: true,
                                    year: 12,
                                    updated_at: '2021-08-26 21:34:25 UTC',
                                    created_at: '2021-08-26 21:34:25 UTC',
                                    distillery_id: 7,
                                    id: 3
                                    })
    visit '/scotches/2/edit'
  end

  it 'only shows editable fields for the scotch selected' do
    # User Story 14, Child Update (x2); As a visitor; # When I visit a Child Show page; # Then I see a link to update that Child "Update Child";# When I click the link; # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:; # When I click the button to submit the form "Update Child"; # Then a `PATCH` request is sent to '/child_table_name/:id',;# the child's data is updated,;# and I am redirected to the Child Show page where I see the Child's updated information
    expect(current_path).to eq('/scotches/2/edit')
    expect(page).to have_content('Edit Bowmore 10 yr')
    expect(page).to have_no_content('Edit An OA')
    fill_in('Year:', with: '5')
    fill_in('Scotch Name:', with: 'Bowmore 5 yr')
    uncheck('Yes')

    expect(page).to have_button('Update')

    click_button 'Update'

    expect(current_path).to eq('/scotches/2')
    expect(page).to have_content('Bowmore 5 yr')
    expect(page).to have_content('5')
    expect(page).to have_no_content('An OA')
    expect(page).to have_no_content('true')
  end
end

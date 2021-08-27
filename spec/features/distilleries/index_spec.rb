# User Story 1, Parent Index (x2)
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system
require 'rails_helper'
# rspec spec/features/distilleries/index_spec.rb
RSpec.describe 'distilleries index page', type: :feature do
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
    visit '/distilleries'
  end

  it 'can see the names of all distilleries' do
    expect(page).to have_content(@distillery_6.name)
    expect(page).to have_content(@distillery_1.name)
    expect(page).to have_content(@distillery_7.name)
  end

  it 'displays records in order of creation (most recently created first)' do
    expect("Laphroaig").to appear_before("Ardbeg", only_text: true)
    expect("Bowmore").to appear_before("Laphroaig", only_text: true)
  end

  it 'displays the date the record was created for each distillery' do
    expect("2021-08-26 01:11:07 UTC").to appear_before("Laphroaig", only_text: true)
    expect("2021-08-26 00:06:30 UTC").to appear_before("Ardbeg", only_text: true)
    expect("2021-08-25 16:34:12 UTC").to_not appear_before("Laphroaig", only_text: true)
    expect("2021-08-26 00:06:30 UTC").to_not appear_before("Bowmore", only_text: true)
  end

  it 'links to each distilleries show page' do
    expect(page).to have_link(@distillery_6.name)

    click_link @distillery_6.name

    expect(current_path).to eq("/distilleries/#{@distillery_6.id}")
    expect(page).to have_content(@distillery_6.name)
  end

end

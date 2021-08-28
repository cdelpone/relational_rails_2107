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
    # User Story 1, Parent Index (x2)
    # For each parent table; # As a visitor; # When I visit '/parents'; # Then I see the name of each parent record in the system
    expect(page).to have_content(@distillery_6.name)
    expect(page).to have_content(@distillery_1.name)
    expect(page).to have_content(@distillery_7.name)
  end

  it 'displays records in order of creation (most recently created first)' do
    # User Story 6, Parent Index sorted by Most Recently Created (x2)
    # As a visitor; # When I visit the parent index,; # I see that records are ordered by most recently created first; # And next to each of the records I see when it was created
    expect("Laphroaig").to appear_before("Ardbeg", only_text: true)
    expect("Bowmore").to appear_before("Laphroaig", only_text: true)
  end

  it 'displays the date the record was created for each distillery' do
    # User Story 6, Parent Index sorted by Most Recently Created (x2)
    # As a visitor; # When I visit the parent index,; # I see that records are ordered by most recently created first; # And next to each of the records I see when it was created
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

  it 'shows a link to the distillery index page' do
    # User Story 9, Parent Index Link
    # As a visitor; # When I visit any page on the site; # Then I see a link at the top of the page that takes me to the Parent Index
    expect(page).to have_link('Distilleries')
    click_link 'Distilleries'
    expect(current_path).to eq("/distilleries")
  end

  it 'shows a link to the scotches index page' do
    # User Story 9, Parent Index Link
    # As a visitor; # When I visit any page on the site; # Then I see a link at the top of the page that takes me to the Parent Index
    expect(page).to have_link('Scotches')
    click_link 'Scotches'
    expect(current_path).to eq("/scotches")
  end

  it 'shows a link to create a new distillery' do
    # User Story 11, Parent Creation (x2)
    # As a visitor; # When I visit the Parent Index page; # Then I see a link to create a new Parent record, "New Parent"; # When I click this link; # Then I am taken to '/parents/new' where I  see a form for a new parent record; # When I fill out the form with a new parent's attributes:; # And I click the button "Create Parent" to submit the form; # Then a `POST` request is sent to the '/parents' route,; # a new parent record is created,; # and I am redirected to the Parent Index page where I see the new Parent displayed.
    expect(page).to have_link('New Distillery')
    click_link 'New Distillery'
    expect(current_path).to eq("/distilleries/new")
  end
end

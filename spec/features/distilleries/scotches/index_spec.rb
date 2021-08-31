require 'rails_helper'
# rspec spec/features/distilleries/scotches/index_spec.rb
RSpec.describe 'Distillery scotches index' do
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
                                    scotland_location: false,
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
    @scotch_14 = @distillery_7.scotches.create!({
                                    name: "Bowmore 14 yr",
                                    single_malt: false,
                                    year: 12,
                                    updated_at: '2021-08-26 21:34:25 UTC',
                                    created_at: '2021-08-26 21:34:25 UTC',
                                    id: 14
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
    @scotch_5 = Scotch.create!({
                                    name: "Bowmore 5 yr",
                                    single_malt: true,
                                    year: 18,
                                    updated_at: '2021-08-26 21:34:25 UTC',
                                    created_at: '2021-08-26 21:34:25 UTC',
                                    distillery_id: 7,
                                    id: 5
                                    })
    visit "/distilleries/#{@distillery_7.id}/scotches"
  end

  it 'shows all attributes of scotches associated with the distillery' do
    # User Story 5, Parent Children Index (x2)
    # As a visitor; # When I visit '/parents/:parent_id/child_table_name'; # Then I see each Child that is associated with that Parent with each Child's attributes:
    expect(page).to have_content(@scotch_2.name)
    expect(page).to have_content(@scotch_14.name)
    expect(page).to have_content(@scotch_2.single_malt)
    expect(page).to have_content(@scotch_2.year)
    expect(page).to have_content(@scotch_2.distillery_id)
    expect(@scotch_2.distillery_id).to eq(7)
    expect(page).to have_content(@scotch_2.updated_at)
    expect(page).to have_content(@scotch_2.created_at)
  end

  it 'links to the distillery index page(interactivity)' do
    # User Story 9, Parent Index Link
    # As a visitor; # When I visit any page on the site; # Then I see a link at the top of the page that takes me to the Parent Index
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

  it 'has a link to create new scotch for this distillery' do
    # User Story 13, Parent Child Creation (x2); # As a visitor; # When I visit a Parent Childs Index page; # Then I see a link to add a new adoptable child for that parent "Create Child"; # When I click the link; # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child; # When I fill in the form with the child's attributes; # And I click the button "Create Child"; # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',; # a new child object/row is created for that parent,; # and I am redirected to the Parent Childs Index page where I can see the new child listed;
    expect(page).to have_link('Create Scotch')

    click_link 'Create Scotch'

    expect(current_path).to eq("/distilleries/7/scotches/new")
    expect(page).to have_content('New Scotch')

    fill_in "Scotch Name:", with: 'Bowmore 15 yr'
    fill_in 'Year:', with: '15'

    expect(page).to have_button('Create Scotch')

    click_button 'Create Scotch'
    save_and_open_page

    expect(current_path).to eq("/distilleries/#{@distillery_7.id}/scotches")
    expect(page).to have_content('Bowmore 15 yr')
    expect(page).to have_content('15')
    expect(page).to have_content('false')
  end

  it 'links to a an alphabetically sorted list of scotches' do
    # User Story 16, Sort Parent's Children in Alphabetical Order by name (x2);
    # As a visitor; # When I visit the Parent's children Index Page; # Then I see a link to sort children in alphabetical order; # When I click on the link; # I'm taken back to the Parent's children Index Page where I see all of the parent's children in alphabetical order
    scotch_8 = Scotch.create!({
                                    name: "Cool Scotch 20 yr",
                                    single_malt: true,
                                    year: 20,
                                    updated_at: '2021-08-26 21:34:25 UTC',
                                    created_at: '2021-08-26 21:34:25 UTC',
                                    distillery_id: 7,
                                    id: 8
                                    })
    scotch_9 = Scotch.create!({
                                    name: "A Cool Scotch 2 yr",
                                    single_malt: false,
                                    year: 2,
                                    updated_at: '2021-08-26 21:34:25 UTC',
                                    created_at: '2021-08-26 21:34:25 UTC',
                                    distillery_id: 7,
                                    id: 9
                                    })

    expect(page).to have_link('Sort Alphabetically')

    click_link 'Sort Alphabetically'

    expect(current_path).to eq("/distilleries/7/scotches")
    expect("A Cool Scotch 2 yr").to appear_before("Cool Scotch 20 yr", only_text: true)
    expect("A Cool Scotch 2 yr").to appear_before("Bowmore 5 yr", only_text: true)
    expect("Bowmore 10 yr").to appear_before("Cool Scotch 20 yr", only_text: true)
  end
  it 'links to each scotches show page' do
  end
  it 'links to each scotches edit page' do
  end
  it 'deletes each scotch' do
  end
  it 'returns to the parent homepage' do
  end
end

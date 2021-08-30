require 'rails_helper'
# rspec spec/features/distilleries/new_spec.rb
RSpec.describe 'new distillery page', type: :feature do
  before :each do
    visit '/distilleries/new'
  end

  it 'has a new distilleries page' do
    # User Story 11, Parent Creation (x2)
    # As a visitor; # When I visit the Parent Index page; # Then I see a link to create a new Parent record, "New Parent"; # When I click this link; # Then I am taken to '/parents/new' where I  see a form for a new parent record; # When I fill out the form with a new parent's attributes:; # And I click the button "Create Parent" to submit the form; # Then a `POST` request is sent to the '/parents' route,; # a new parent record is created,; # and I am redirected to the Parent Index page where I see the new Parent displayed.
    expect(page).to have_content('New Distillery')
  end

  it 'has a create distilleries button' do
    # User Story 11, Parent Creation (x2)
    # As a visitor; # When I visit the Parent Index page; # Then I see a link to create a new Parent record, "New Parent"; # When I click this link; # Then I am taken to '/parents/new' where I  see a form for a new parent record; # When I fill out the form with a new parent's attributes:; # And I click the button "Create Parent" to submit the form; # Then a `POST` request is sent to the '/parents' route,; # a new parent record is created,; # and I am redirected to the Parent Index page where I see the new Parent displayed.
    # expect(page).to have_select 'distillery[scotland_location]', options: ['true', 'false']
    fill_in 'distillery[name]', with: "Highland Park Distillery"
    choose 'false'
    fill_in 'distillery[established]', with: '1798'
    expect(page).to have_button('Create Distillery')
    # require "pry"; binding.pry
  end

  it 'redirects to distilleries index and shows new disillery' do
    # User Story 11, Parent Creation (x2)
    # As a visitor; # When I visit the Parent Index page; # Then I see a link to create a new Parent record, "New Parent"; # When I click this link; # Then I am taken to '/parents/new' where I  see a form for a new parent record; # When I fill out the form with a new parent's attributes:; # And I click the button "Create Parent" to submit the form; # Then a `POST` request is sent to the '/parents' route,; # a new parent record is created,; # and I am redirected to the Parent Index page where I see the new Parent displayed.
    fill_in 'distillery[name]', with: "Highland Park Distillery"
    choose 'false'
    fill_in 'distillery[established]', with: '1798'
    click_button 'Create Distillery'
    expect(current_path).to eq('/distilleries')
    expect(page).to have_content('Highland Park')
    expect(page).to have_content('false')
    expect(page).to have_content('1798')
  end
  # before { get :new }
  # it { should redirect_to('/distilleries') }
end

require 'spec_helper'

feature "Record a new building", %q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
  } do

    # Acceptance Criteria:

    # I must specify a street address, city, state, and postal code
    # Only US states can be specified
    # I can optionally specify a description of the building
    # If I enter all of the required information in the required format, the building is recorded.
    # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
    # Upon successfully creating a building, I am redirected so that I can record another building.

  context 'user provides relevent information' do
    it 'creates a new building' do
      count = Building.all.count
      name = 'The Dorchester'
      street_address = '1116 Dorchester Ave'
      city = 'Boston'
      postal_code = '02125'
      state = 'MA'

      visit new_building_path
      fill_in "Name", with: name
      fill_in "Street Address", with: street_address
      fill_in "City", with: city
      fill_in "Postal Code", with: postal_code
      select state, from: "State"
      click_on "Create New Building"

      expect(Building.all.count).to eql(count + 1)
      current_path.should eq(new_building_path)
      expect(page).to have_content "Create a New Building"
    end
  end

  context 'user provides incomplete information' do
    it 'presents errors' do
      visit new_building_path

      click_on "Create New Building"

      expect(page).to have_content "Name is too short (minimum is 1 characters)"
      expect(page).to have_content "Street Address is too short (minimum is 1 characters)"
      expect(page).to have_content "City is too short (minimum is 1 characters)"
      expect(page).to have_content "Postal Code is too short (minimum is 1 characters)"
      expect(page).to have_content "State is not included in the list"
    end
  end
end





















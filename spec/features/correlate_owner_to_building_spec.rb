require 'spec_helper'

feature "Record a new building owner", %q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
  } do

  # Acceptance Criteria:

  # When recording a building, I want to optionally associate the building with its rightful owner.
  # If I delete an owner, the owner and its primary key should no longer be associated with any properties.

  context 'create a building with owner' do
    it 'creates a new building' do
      count = Building.all.count
      name = 'The Dorchester'
      street_address = '1116 Dorchester Ave'
      city = 'Boston'
      postal_code = '02125'
      state = 'MA'
      owner = FactoryGirl.create(:owner)

      visit new_building_path
      save_and_open_page
      fill_in "Name", with: name
      fill_in "Street Address", with: street_address
      fill_in "City", with: city
      fill_in "Postal Code", with: postal_code
      select state, from: "State"
      select owner.first_name, from: "Owner"
      click_on "Create New Building"

      expect(Building.all.count).to eql(count + 1)
      current_path.should eq(new_building_path)
    end
  end
end

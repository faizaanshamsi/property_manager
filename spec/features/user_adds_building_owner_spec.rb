require 'spec_helper'

feature "Record a new building", %q{
  As a real estate associate
  I want to record a building owner
  So that I can keep track of our relationships with owners
  } do

  # Acceptance Criteria:

  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  context 'user provides relevant information' do
    it 'creates a new owner' do
      count = Owner.all.count
      first_name = 'Faizaan'
      last_name = 'Shamsi'
      email = 'faizaan@shamsi.com'
      company = 'Faizaan Enterprises'

      visit new_owner_path
      fill_in "First Name", with: first_name
      fill_in "Last Name", with: last_name
      fill_in "Email", with: email
      fill_in "company", with: company
      click_on "Create New Owner"

      expect(Owner.all.count).to eql(count + 1)
      current_path.should eq(new_owner_path)
      expect(page).to have_content "Create a New Owner"
    end
  end

  context 'user does not provide all information' do
    it 'presents errors' do
      visit new_owner_path

      click_on "Create New Owner"
      expect(page).to have_content "First Nameis too short (minimum is 1 characters)"
      expect(page).to have_content "Last Nameis too short (minimum is 1 characters)"
      expect(page).to have_content "Emailis too short (minimum is 1 characters)"
    end
  end

end

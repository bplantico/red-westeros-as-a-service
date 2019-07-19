require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'when I visit root_path and select a house' do
    it 'shows the members of that house' do
      visit root_path

      fill_in :q, with: 'Greyjoy'

      click_on 'Get Members'

      expect(current_path).to eq('/search')

      expect(page).to have_content('Greyjoy has 7 members')

      expect(page).to have_content('Member name: Balon Greyjoy')
      expect(page).to have_content('Member ID: 38')

      expect(page).to have_content('Member name: Alannys Greyjoy')
      expect(page).to have_content('Member ID: 39')

      expect(page).to have_content('Member name: Euron Greyjoy')
      expect(page).to have_content('Member ID: 44')
    end
  end
end

# As a user
# When I visit "/"
# And I select "Greyjoy" from the dropdown
# And I click on "Get Members"
# Then my path should be "/search" with "house=greyjoy" in the parameters
# And I should see a message "7 Members"
# And I should see a list of the 7 members of House Greyjoy
# And I should see a name and id for each member.

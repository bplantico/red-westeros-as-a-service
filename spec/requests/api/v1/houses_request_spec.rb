require 'rails_helper'

RSpec.describe "Houses API" do
  it "shows a houses members" do
    members = create_list(:member, 7)

    get 'api/v1/houses/greyjoy'
    expect(response).to be_successful

    house_data = JSON.parse(response.body)

    expect(house_data["data"]["attributes"]["members"].count).to eq(7)
  end
end

# As a user
# When I visit "/"
# And I select "Greyjoy" from the dropdown
# And I click on "Get Members"
# Then my path should be "/search" with "house=greyjoy" in the parameters
# And I should see a message "7 Members"
# And I should see a list of the 7 members of House Greyjoy
# And I should see a name and id for each member.```

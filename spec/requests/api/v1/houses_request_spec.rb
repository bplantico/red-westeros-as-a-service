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

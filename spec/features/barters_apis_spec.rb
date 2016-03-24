require 'rails_helper'

RSpec.feature "BartersApis", type: :feature do
  describe "User creates a new product listing" do
    # this tests the create new listing form
    it "can create a listing and save it to a database" do

      visit "/barters/new"
      expect(page).to have_content('New Product Listing')
      fill_in 'Product', with: 'lemon'
      fill_in 'Description', with: '20 lemons'
      select 'Goods', from: "Category"
      select 'Hillcrest', from: "Neighborhood"
      fill_in 'City', with: 'San Diego'
      select 'California', from: "State"
      fill_in 'Zip', with: 92105

      click_button "Create Barter"

      barter = Barter.last

      expect(barter.product).to eq 'lemon'
    end
  end
end

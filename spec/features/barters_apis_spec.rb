require 'rails_helper'

RSpec.feature "BartersApis", type: :feature do
  describe "User creates a new product listing" do

    it "can create a listing and save it to a database" do

      visit "/barters/new"
      expect(page).to have_content('New Product Listing')
      fill_in 'Product', with: 'lemon'
      fill_in 'Description', with: '20 lemons'
      fill_in 'Category', with: 'fruit'
      fill_in 'Location', with: 'Hillcrest'

      click_button "Create Barter"

      barter = Barter.last

      expect(barter.product).to eq 'lemon'
    end
  end
end

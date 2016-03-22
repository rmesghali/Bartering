require 'rails_helper'

RSpec.feature "BartersApis", type: :feature do
  describe "User creates a new product listing" do

    it "can create a listing and save it to a database" do

      visit "/barters/new"
      fill_in 'Product', with 'lemon'
      fill_in 'Description', with '20 lemons'
      fill_in 'Category', with 'fruit'
      fill_in 'Location', with 'Hillcrest'

      click_button "Create Barter"
      expect(page).to have_text("New Product List")
    end
  end
end

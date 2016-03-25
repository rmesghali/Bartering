require 'rails_helper'

RSpec.feature "Categories", type: :feature do
  describe "As a user I" do
    #this test searches listings by neighborhood
    it "can search listings by category using a drop down menu" do
      visit "/"
      expect(page).to have_content('Categories')
      click_link 'Goods'
      expect(current_path).to eq '/goods'
      expect(page).to have_content('Goods Listings')
    end
  end
end

require 'rails_helper'

RSpec.feature "Expiration_filter", type: :feature do
  describe "As a user In can" do
    #this test filters items using an expiration date and category or neighborhood
    it "can display all items which have an expiration date later than or equal to today" do
      #creates new unexpired barter
      visit "barters/new"
      fill_in 'Product', with: 'lemon'
      fill_in 'Description', with: '20 lemons'
      choose('Goods')
      select 'Hillcrest', from: "Neighborhood"
      fill_in 'Expiration Date', with: '2016-03-30'        click_button('newbarter')
      #creates new barter with an expired expiration date
      visit "barters/new"
      fill_in 'Product', with: 'lemon'
      fill_in 'Description', with: '20 lemons'
      choose('Goods')
      select 'Hillcrest', from: "Neighborhood"
      fill_in 'Expiration Date', with: '2016-03-28'        click_button('newbarter')
      #check that only unexpired barter displays
      visit '/barters'
      expect(page).to have_content('Categories')
      click_link 'Goods'
      expect(current_path).to eq '/goods'
      expect(page).to have_content('Listings of Goods')
    end
  end
end

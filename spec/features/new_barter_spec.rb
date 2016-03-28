require 'rails_helper'

RSpec.feature "SearchNeighborhoods", type: :feature, js: true do
  describe "As a user I" do
    #this test searches listings by neighborhood
    it "can click on new barter and be taken to barters/new" do
      visit "/barters"
      click_link 'New Barter'
      expect(page).to have_content('New Barter')
      expect(current_path).to eq '/barters/new'
    end
    it "can fill in form and create barter" do
      visit "barters/new"
      fill_in 'Product', with: 'lemon'
      fill_in 'Description', with: '20 lemons'
      choose('Goods')
      select 'Hillcrest', from: "Neighborhood"
      fill_in 'Expiration Date', with: '05/01/2016'
      click_button('newbarter')
    end
    it "can display the newly created barter information" do
      visit "barters/new"
      fill_in 'Product', with: 'lemon'
      fill_in 'Description', with: '20 lemons'
      choose('Goods')
      select 'Hillcrest', from: "Neighborhood"
      fill_in 'Expiration Date', with: '05/01/2016'
      click_button('newbarter')
      expect(page).to have_content('Barter was successfully created')
      expect(page).to have_content('lemon')
      expect(page).to have_content('20 lemons')
      expect(page).to have_content('Goods')
      expect(page).to have_content('hillcrest')
      expect(page).to have_content('2016-01-05')
    end
  end
end

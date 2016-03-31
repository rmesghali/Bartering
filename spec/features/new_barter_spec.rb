require 'rails_helper'

RSpec.feature "Create New Barter", type: :feature do
  describe "As a user I" do
    #this test creates a new user and a new barter
    it "can fill in form and create a new barter" do
      visit '/'
      expect(page).to have_content("Home")
      click_link "Sign up"
      expect(current_path).to eq('/users/sign_up')
      fill_in "user_email", with: "test@learn.com"
      fill_in "user_password", with: "test12345"
      fill_in "user_password_confirmation", with: "test12345"
      click_button "Sign up"
      expect(current_path).to eq('/')
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

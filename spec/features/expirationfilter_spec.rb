require 'rails_helper'

RSpec.feature "Expiration_filter", type: :feature do
  describe "As a signed in user In can" do
    #this test filters items using an expiration date and category or neighborhood
    it "can display all items which have an expiration date later than or equal to today" do
      sign_user_up

      #creates new unexpired barter
      visit "barters/new"

      # Check on the right page
      expect(page).to have_content('Create New Listing')
      #find("id[data-target='#product']").fill_in with: 'limes'
      fill_in 'Product', with: 'limes'
      fill_in 'Description', with: '20 limes'
      choose('Goods')
      select 'Hillcrest', from: "Neighborhood"
      fill_in 'Expiration Date', with: '2016-03-30'
      click_button('newbarter')
      #creates new barter with an expired expiration date
      visit "/barters/new"
      fill_in 'Product', with: 'lemon'
      fill_in 'Description', with: '20 lemons'
      choose('Goods')
      select 'Hillcrest', from: "Neighborhood"
      fill_in 'Expiration Date', with: '2016-03-31'
      click_button('newbarter')
      #check that only unexpired barter displays
      visit '/barters'
      expect(page).to have_content('lemons')
      expect(page).to_not have_content('limes')
    end
  end

  # sign up and get logged in
  def sign_user_up
    visit '/users/sign_up'
    fill_in "user_email", with: "me@learn.com"
    fill_in "user_password", with: "notch8learn"
    fill_in "user_password_confirmation", with: "notch8learn"
    click_button "Sign up"
  end
end

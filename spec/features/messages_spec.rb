require 'rails_helper'

RSpec.feature "Messages", type: :feature  do
  describe "As a signed-in participant" do
    it "I can go to a listing and create a new comment" do
      create_user
      create_barter

      user = User.first
      barter = Barter.first

      p barter.id

      # visit '/barters/barter'
    end
    #  Story: As a user I can sign up with email address and password.
    # it "should sign up" do
    #   visit 'users/sign_up'
    #   expect(page).to have_content("Sign up")
    #   fill_in "user_email", with: "me@learn.com"
    #   fill_in "user_password", with: "notch8learn"
    #   fill_in "user_password_confirmation", with: "notch8learn"
    #   click_button "Sign up"
    #   expect(current_path).to eq('/')
    #   expect(page).to have_content("TRADE")
    # end
  end
end

def create_user
  visit '/'
  expect(page).to have_content("Sign up")
  click_link_or_button "Sign up"
  expect(page).to have_content("Sign up")
  fill_in "user_email", with: "me@learn.com"
  fill_in "user_password", with: "notch8learn"
  fill_in "user_password_confirmation", with: "notch8learn"

  click_button "Sign up"
  expect(current_path).to eq('/')
  expect(page).to have_content("TRADE")
end

def create_barter
  visit "/barters/new"
  expect(page).to have_content('Create New Listing')
  expect(page).to have_content('Submit')

  fill_in 'Product', with: 'lemon'
  fill_in 'Description', with: '20 lemons'
  #select 'Goods', from: "radio"
  choose('Goods')
  select 'Hillcrest', from: "Neighborhood"

  click_button "newbarter"
  expect(page).to have_content('lemon')
  expect(page).to have_content('hillcrest')
end

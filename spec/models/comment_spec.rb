require 'rails_helper'
# require 'test_helper'

RSpec.describe Comment, type: :model do

  it "can be accepted by barter owner" do
    expect(User.create(username: 'Tiger')). to be_truthy
    expect(User.first).to be_a(User)
    expect(User.first.username).to eq('Tiger')
  end

  it "can be declined by barter owner" do

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
  fill_in 'Expiration', with: "2016/01/20"

  click_button "newbarter"
  expect(page).to have_content('lemon')
  expect(page).to have_content('hillcrest')
end

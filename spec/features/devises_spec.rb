require 'rails_helper'

RSpec.feature "Devises", type: :feature, js: true do

  # Story: As a user I can sign up, log in, log out.
  describe "sign up with email address and password" do
    it "should go to sign up page" do
      visit 'users/sign_up'
      expect(page).to have_content("Sign up")
    end
    #  Story: As a user I can sign up with email address and password.
    it "should sign up" do
      visit 'users/sign_up'
      expect(page).to have_content("Sign up")
      fill_in "user_email", with: "me@learn.com"
      fill_in "user_password", with: "notch8learn"
      fill_in "user_password_confirmation", with: "notch8learn"
      click_button "Sign up"
      expect(current_path).to eq('/')
      expect(page).to have_content("TRADE")
    end
  end

  # As a user I can Login
  describe "login a user" do
    it "should go to the login page" do
      visit 'users/sign_in'
      expect(page).to have_content("Log in")
    end

    # Story: As a user I can log in and out.
    it "should login a user" do
      create_user_me
      visit 'users/sign_in'
      expect(page).to have_content("Log in")
      login_user_me
      click_link "Logout"
      expect(current_path).to eq('users/sign_in')
      expect(page).to have_content("Log in")
    end

    # Story: As a user I can only edit listins that I have created.
    # it "Should only permit user to edit content the have created" do
    #   create_user_me
    #   create_apt
    #   click_link "Logout"
    #   create_user_you
    #   expect(page).to have_no_content('Edit')
    #   expect(page).to have_no_content('Destroy')
    # end

    # Story: As a user I can only remove listings that I have created.
  end

  def create_user_me
    visit 'users/sign_up'
    expect(page).to have_content("Sign up")
    fill_in "user_email", with: "me@learn.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
  end

  def create_user_you
    visit 'users/sign_up'
    expect(page).to have_content("Sign up")
    fill_in "user_email", with: "you@learn.com"
    fill_in "user_password", with: "password"
    fill_in "user_password_confirmation", with: "password"
    click_button "Sign up"
  end

  def login_user_me
    # visit 'users/sign_in'
    expect(page).to have_content("Log in")
    fill_in "user_email", with: "me@learn.com"
    fill_in "user_password", with: "password"
    click_button "Log in"
  end

  def Logout
    click_link "Logout"
    expect(current_path).to eq('/')
    expect(page).to have_content("TRADE")
  end


  # test example for adding an image to a new listing
  # def create_apt
  #   click_link 'New Barter'
  #   click_button 'Choose File'
  #   attach_file "File", "spec/asset_specs/photos/photo.jpg"
  #   fill_in "apartment[address]", with: "123 any street"
  # end
end

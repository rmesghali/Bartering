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

  before(:each) do
    User.destroy_all
  end

  it "can be marked declined" do
    make_a_trade
    # Decline offer
    @comment1.set_declined

    # Reload from database to updates from database
    @barter.reload
    expect(@barter.comments.select{ |comment| comment.accept == false }.first.comment).to eq "1st comment"
    expect(@barter.comments.select{ |comment| comment.accept.nil? }.first.comment).to eq "2nd comment"
  end

  it "can be marked accepted, thus making all other comments for the barter at hand declined" do
    make_a_trade
    # accept offer
    @comment1.set_accepted

    # Reload from database to updates from database
    @barter.reload
    expect(@barter.comments.select{ |comment| comment.accept == true }.first.comment).to eq "1st comment"
    expect(@barter.comments.select{ |comment| comment.accept == false }.first.comment).to eq "2nd comment"
  end

  def make_a_trade
    @owner_user = User.new
    @owner_user.email = "owner@dom.com"
    @owner_user.save
    @barter = Barter.new
    @barter.user = @owner_user
    @barter.description = "yummy apples"
    @barter.category = "goods"
    @barter.expiration = Date.tomorrow
    @barter.product = "apple"
    @barter.neighborhood = "hillcrest"
    @barter.interested_in = "bananas"
    # check that @barter saves to db
    # @barter.save
    # puts @barter.errors.full_messages
    expect(@barter.save).to eq true

    # check that @barter's owner is @owner_user
    expect(@barter.user).to eq @owner_user
    @comment_user = User.new
    @comment_user.email = "comment@me.com"
    @comment_user.save
    @comment1 = Comment.new
    @comment1.user = @comment_user
    @comment1.barter = @barter
    @comment1.comment = "1st comment"
    expect(@comment1.save).to eq true
    # check that @comment1 user is @comment_user
    expect(@comment1.user).to eq @comment_user
    @comment2 = Comment.new
    @comment2.user = @comment_user
    @comment2.barter = @barter
    @comment2.comment = "2nd comment"
    @comment2.save
    expect(@comment1.accept).to be_nil
    expect(@comment2.accept).to be_nil
    # check that all @barters comments have accept = to nil
    @barter.comments.each do |comment|
      expect(comment.accept).to be_nil
    end
    # check how many comments the barter has.
    expect(@barter.comments.count).to eq 2
  end
end

require 'rails_helper'

RSpec.describe "Comments", type: :request do
  require 'rails_helper'

  describe "As a signed-in participant" do
    it "I can go to a listing and create a new comment" do
      create_user
      create_barter

      user = User.last
      # barter = Barter.last
      # barter_id = barter.id

      # visit 'barters/barter_id'
      # expect(page).to have_content("New Comment")
    end
  end
end

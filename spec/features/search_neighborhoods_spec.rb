require 'rails_helper'

RSpec.feature "SearchNeighborhoods", type: :feature do
  describe "As a user I" do
    #this test searches listings by neighborhood
    it "can search listings by neighborhood using a drop down menu" do
      visit "/barters"
      expect(page).to have_content('Hillcrest')
      click_link 'Hillcrest'
      expect(current_path).to eq '/hillcrest'
      expect(page).to have_content('Hillcrest')
    end
  end
end

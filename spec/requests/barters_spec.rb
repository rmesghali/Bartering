require 'rails_helper'

RSpec.describe "Barters", type: :request do
  describe "GET /barters" do
    it "works! (now write some real specs)" do
      get barters_path
      expect(response).to have_http_status(200)
    end
  end
end

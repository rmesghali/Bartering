require 'rails_helper'

RSpec.describe "barters/index", type: :view do
  before(:each) do
    assign(:barters, [
      Barter.create!(
        :product => "Product",
        :description => "MyText",
        :category => "MyText",
        :location => "MyText"
      ),
      Barter.create!(
        :product => "Product",
        :description => "MyText",
        :category => "MyText",
        :location => "MyText"
      )
    ])
  end

  it "renders a list of barters" do
    render
    assert_select "tr>td", :text => "Product".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end

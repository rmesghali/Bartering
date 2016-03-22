require 'rails_helper'

RSpec.describe "barters/edit", type: :view do
  before(:each) do
    @barter = assign(:barter, Barter.create!(
      :product => "MyString",
      :description => "MyText",
      :category => "MyText",
      :location => "MyText"
    ))
  end

  it "renders the edit barter form" do
    render

    assert_select "form[action=?][method=?]", barter_path(@barter), "post" do

      assert_select "input#barter_product[name=?]", "barter[product]"

      assert_select "textarea#barter_description[name=?]", "barter[description]"

      assert_select "textarea#barter_category[name=?]", "barter[category]"

      assert_select "textarea#barter_location[name=?]", "barter[location]"
    end
  end
end

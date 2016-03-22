require 'rails_helper'

RSpec.describe "barters/show", type: :view do
  before(:each) do
    @barter = assign(:barter, Barter.create!(
      :product => "Product",
      :description => "MyText",
      :category => "MyText",
      :location => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Product/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end

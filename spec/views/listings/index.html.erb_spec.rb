require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    assign(:listings, [
      Listing.create!(
        title: "Title",
        description: nil,
        price: 2,
        business: "Business",
        instagram: "Instagram",
        booked: false,
        user: nil,
        category: nil,
        city: nil
      ),
      Listing.create!(
        title: "Title",
        description: nil,
        price: 2,
        business: "Business",
        instagram: "Instagram",
        booked: false,
        user: nil,
        category: nil,
        city: nil
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Business".to_s, count: 2
    assert_select "tr>td", text: "Instagram".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end

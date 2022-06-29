require 'rails_helper'

RSpec.describe "listings/new", type: :view do
  before(:each) do
    assign(:listing, Listing.new(
      title: "MyString",
      description: nil,
      price: 1,
      business: "MyString",
      instagram: "MyString",
      booked: false,
      user: nil,
      category: nil,
      city: nil
    ))
  end

  it "renders new listing form" do
    render

    assert_select "form[action=?][method=?]", listings_path, "post" do

      assert_select "input[name=?]", "listing[title]"

      assert_select "input[name=?]", "listing[description]"

      assert_select "input[name=?]", "listing[price]"

      assert_select "input[name=?]", "listing[business]"

      assert_select "input[name=?]", "listing[instagram]"

      assert_select "input[name=?]", "listing[booked]"

      assert_select "input[name=?]", "listing[user_id]"

      assert_select "input[name=?]", "listing[category_id]"

      assert_select "input[name=?]", "listing[city_id]"
    end
  end
end

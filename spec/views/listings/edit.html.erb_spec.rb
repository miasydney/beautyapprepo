require 'rails_helper'

RSpec.describe "listings/edit", type: :view do
  before(:each) do
    @listing = assign(:listing, Listing.create!(
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

  it "renders the edit listing form" do
    render

    assert_select "form[action=?][method=?]", listing_path(@listing), "post" do

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

class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :city
  has_rich_text :description
end

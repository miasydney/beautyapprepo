class Listing < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :city
  has_rich_text :description

  has_one_attached :picture

  # def self.search(search)
  #   where("category_id LIKE ?",%"#{search}")
  # end

  def self.search(search)
  joins(:category).where(
    ["categories.id like ?", search])
end
end

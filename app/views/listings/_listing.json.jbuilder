json.extract! listing, :id, :title, :description, :price, :business, :instagram, :booked, :date, :time, :user_id, :category_id, :city_id, :created_at, :updated_at
json.url listing_url(listing, format: :json)
json.description listing.description.to_s

class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :price
      t.string :business
      t.string :instagram
      t.boolean :booked
      t.date :date
      t.time :time
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end

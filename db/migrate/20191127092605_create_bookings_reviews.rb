class CreateBookingsReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings_reviews do |t|
      t.references :booking, foreign_key: true
      t.string :content
      t.integer :rating

      t.timestamps
    end
  end
end

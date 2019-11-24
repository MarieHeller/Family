class CreateFams < ActiveRecord::Migration[5.2]
  def change
    create_table :fams do |t|
      t.string :name
      t.integer :members
      t.integer :price
      t.string :origin
      t.string :language
      t.string :housing_type
      t.string :location
      t.string :photos
      t.string :description
      t.string :capacity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

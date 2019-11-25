class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.string :photo
      t.references :fam, foreign_key: true

      t.timestamps
    end
  end
end

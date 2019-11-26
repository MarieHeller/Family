class AddCoordinatesToFams < ActiveRecord::Migration[5.2]
  def change
    add_column :fams, :latitude, :float
    add_column :fams, :longitude, :float
  end
end

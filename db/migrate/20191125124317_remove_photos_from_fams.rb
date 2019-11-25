class RemovePhotosFromFams < ActiveRecord::Migration[5.2]
  def change
    remove_column :fams, :photos
  end
end

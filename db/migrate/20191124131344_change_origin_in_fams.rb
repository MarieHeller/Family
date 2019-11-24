class ChangeOriginInFams < ActiveRecord::Migration[5.2]
  def change
    rename_column :fams, :origin, :cultural_experience
  end
end

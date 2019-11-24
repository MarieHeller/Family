class ChangeDescriptionInFams < ActiveRecord::Migration[5.2]
  def change
    change_column :fams, :description, :text
  end
end

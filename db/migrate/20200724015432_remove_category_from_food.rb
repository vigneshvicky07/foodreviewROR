class RemoveCategoryFromFood < ActiveRecord::Migration[6.0]
  def change
    remove_column :foods, :category, :string
  end
end

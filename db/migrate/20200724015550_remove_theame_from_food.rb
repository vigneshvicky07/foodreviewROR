class RemoveTheameFromFood < ActiveRecord::Migration[6.0]
  def change
    remove_column :foods, :theame, :string
  end
end

class AddthemeAssociationToFood < ActiveRecord::Migration[6.0]
  def self.up
    add_column :foods, :theme_id, :integer
    add_index 'foods', ['theme_id'], :name => 'index_theme_id'
  end

  def self.down
    remove_column :foods, :theme_id
  end
end

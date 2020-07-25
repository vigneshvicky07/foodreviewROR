class AddcategoryAssociationToFood < ActiveRecord::Migration[6.0]
  def self.up
    add_column :foods, :category_id, :integer
    add_index 'foods', ['category_id'], :name => 'index_category_id'
  end

  def self.down
    remove_column :foods, :category_id
  end
end

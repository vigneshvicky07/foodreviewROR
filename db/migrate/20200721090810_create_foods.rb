class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.float :rate
      t.string :theame
      t.string :category

      t.timestamps
    end
  end
end

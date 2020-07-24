class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :feedback
      t.float :rating
      t.belongs_to :food, null: false, foreign_key: true

      t.timestamps
    end
  end
end

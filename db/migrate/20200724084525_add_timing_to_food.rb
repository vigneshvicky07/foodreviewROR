class AddTimingToFood < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :morning, :boolean,default: false
    add_column :foods, :brunch, :boolean,default: false
    add_column :foods, :lunch, :boolean,default: false
    add_column :foods, :afternoon, :boolean,default: false
    add_column :foods, :dinner, :boolean,default: false


  end
end

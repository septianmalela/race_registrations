class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.integer :stock
      t.integer :price
      t.integer :inventoryable_id
      t.string :inventoryable_type
      t.integer :sold_quantity

      t.timestamps
    end
  end
end

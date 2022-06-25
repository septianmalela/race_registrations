class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order
      t.references :member_contest
      t.references :inventory
      t.integer :price, default: 0
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end

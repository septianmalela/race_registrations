class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user
      t.integer :status
      t.integer :total_payment, default: 0
      t.integer :remaining_payment, default: 0
      t.text :description

      t.timestamps
    end
  end
end

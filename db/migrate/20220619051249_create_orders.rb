class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user
      t.string :status
      t.string :total_payment
      t.string :remaining_payment

      t.timestamps
    end
  end
end

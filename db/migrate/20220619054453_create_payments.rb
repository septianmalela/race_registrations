class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.text :avatar_data
      t.string :payment

      t.timestamps
    end
  end
end

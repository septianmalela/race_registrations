class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.references :order, null: false, foreign_key: true
      t.text :avatar_data
      t.integer :payment, default: 0
      t.boolean :confirmable, default: false
      t.text :reason

      t.timestamps
    end
  end
end

class AddDescriptionToPayments < ActiveRecord::Migration[6.1]
  def change
    add_column :payments, :payments, :text
  end
end

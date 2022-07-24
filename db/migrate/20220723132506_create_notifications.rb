class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :information
      t.string :url_path
      t.boolean :read, default: false
      t.integer :notificationable_id
      t.string :notificationable_type

      t.timestamps
    end
  end
end

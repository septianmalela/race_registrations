class CreateValueFormats < ActiveRecord::Migration[6.1]
  def change
    create_table :value_formats do |t|
      t.text :value_format
      t.references :member_contest

      t.timestamps
    end
  end
end

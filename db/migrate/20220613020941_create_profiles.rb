class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :school
      t.string :name
      t.string :phone
      t.integer :type_pmr

      t.timestamps
    end
  end
end

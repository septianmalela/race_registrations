class CreateContests < ActiveRecord::Migration[6.1]
  def change
    create_table :contests do |t|
      t.string :name_school
      t.references :user

      t.timestamps
    end
  end
end

class CreateListContests < ActiveRecord::Migration[6.1]
  def change
    create_table :list_contests do |t|
      t.string  :title
      t.integer :type_pmr
      t.integer :type_contest

      t.timestamps
    end
  end
end

class CreateMemberContests < ActiveRecord::Migration[6.1]
  def change
    create_table :member_contests do |t|
      t.string :school
      t.string :code
      t.string :helper_1
      t.string :helper_2
      t.string :helper_3
      t.references :contest
      t.references :list_contest

      t.timestamps
    end
  end
end

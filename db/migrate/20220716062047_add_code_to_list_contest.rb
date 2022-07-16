class AddCodeToListContest < ActiveRecord::Migration[6.1]
  def change
    add_column :list_contests, :code, :string
  end
end

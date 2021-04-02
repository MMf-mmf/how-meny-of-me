class AddFirstNameMatchesToHistories < ActiveRecord::Migration[6.1]
  def change
    add_column :histories, :first_name_matches, :integer
  end
end

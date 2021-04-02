class AddLastNameMatchesToHistories < ActiveRecord::Migration[6.1]
  def change
    add_column :histories, :last_name_matches, :integer
  end
end

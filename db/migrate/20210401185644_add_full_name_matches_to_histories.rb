class AddFullNameMatchesToHistories < ActiveRecord::Migration[6.1]
  def change
    add_column :histories, :full_name_matches, :integer
  end
end

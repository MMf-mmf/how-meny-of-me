class CreateHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.string :s_name

      t.timestamps
    end
  end
end

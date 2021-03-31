class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :unique_fname
      t.integer :unique_lname
      t.integer :unique_full_name
      t.string "password_digest"
      t.index ["email"], name: "index_users_on_email", unique: true

      t.timestamps
    end
  end
end

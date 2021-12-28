class DropItAllToHell < ActiveRecord::Migration[6.1]
  def change
    drop_table :users
    drop_table :books
    drop_table :books_users
  end
end

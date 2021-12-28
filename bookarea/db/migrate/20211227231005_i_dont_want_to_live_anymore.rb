class IDontWantToLiveAnymore < ActiveRecord::Migration[6.1]
  def change
    drop_table :book_users
  end
end

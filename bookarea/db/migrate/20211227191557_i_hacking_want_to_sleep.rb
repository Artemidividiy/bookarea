class IHackingWantToSleep < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :books_id, true
    change_column_null :books, :users_id, true     
  end
end

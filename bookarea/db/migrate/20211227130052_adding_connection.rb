class AddingConnection < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :liked_by, :text
  end
end

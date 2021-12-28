class CreateBookUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :book_users do |t|
      
      t.timestamps
    end
  end
end

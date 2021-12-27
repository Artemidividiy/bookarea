class NormalMtmConnections < ActiveRecord::Migration[6.1]
  def change
    drop_table :books
    drop_table :users
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :publishing_house
      t.integer :year
      t.string :isbn
      t.belongs_to :users
      t.datetime :created_at, precision: 6, null: false
      t.datetime :updated_at, precision: 6, null: false
    end

    create_table :users do |t|
    t.datetime :created_at, precision: 6, null: false
    t.datetime :updated_at, precision: 6, null: false
    t.string :username, required: true
    t.string :email, required: true
    t.string :password, required: true
    t.string :password_digest
    t.boolean :admin, default: false
    t.belongs_to :books
    end 
  end
end

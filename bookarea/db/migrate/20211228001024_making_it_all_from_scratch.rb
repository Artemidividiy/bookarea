# frozen_string_literal: true

class MakingItAllFromScratch < ActiveRecord::Migration[6.1]
  def change
    create_table 'users', force: :cascade do |t|
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
      t.string 'username'
      t.string 'email'
      t.string 'password_digest'
      t.boolean 'admin', default: false
    end

    create_table 'books', force: :cascade do |t|
      t.string 'name'
      t.string 'author'
      t.string 'publishing_house'
      t.integer 'year'
      t.string 'isbn'
      t.datetime 'created_at', precision: 6, null: false
      t.datetime 'updated_at', precision: 6, null: false
    end
    create_table 'connections', force: :cascade do |t|
      t.integer 'book_id'
      t.integer 'user_id'
    end

    add_index 'connections', ['user_id'], name: 'index_connections_on_user_id'
    add_index 'connections', ['book_id'], name: 'index_connections_on_book_id'
  end
end

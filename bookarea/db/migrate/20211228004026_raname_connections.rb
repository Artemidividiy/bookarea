# frozen_string_literal: true

class RanameConnections < ActiveRecord::Migration[6.1]
  def change
    rename_table :connections, :relations
  end
end

# frozen_string_literal: true

class Relation < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, uniqueness: { scope: :book_id }
end

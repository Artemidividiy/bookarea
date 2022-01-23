# frozen_string_literal: true

class User < ApplicationRecord
  has_many :relations
  has_many :books, through: :relations
  has_secure_password
  validates_presence_of :username, :email, :password_digest
  validates_uniqueness_of :username, :email
  validates :password, confirmation: { case_sensitive: true }
end

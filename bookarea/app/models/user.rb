class User < ApplicationRecord
    has_secure_password
    validates_presence_of :username, :email, :password
    validates_uniqueness_of :username, :email
    validates :password, confirmation: { case_sensitive: true }
    has_and_belongs_to_many :books
  end
  
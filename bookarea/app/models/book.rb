class Book < ApplicationRecord
    has_many :relations
    has_many :users, through: :relations
    validates_presence_of :name, :author
end

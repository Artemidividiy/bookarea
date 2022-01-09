class Book < ApplicationRecord
  has_many :relations
  has_many :users, through: :relations
  validates_presence_of :name, :author
  validates_uniqueness_of :isbn
  def related?(user)
		!!self.relations.find{|relation| relation.user_id == user.id}
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Relation, type: :model do
  before(:each) do
    Relation.delete_all
    User.delete_all
    Book.delete_all
  end
  it 'should add new records' do
    Book.create(name: 'test name', author: 'test author', publishing_house: 'test ph', year: 2020,
                isbn: 'doesn\'t matter')
    User.create(username: 'test', email: "doesn't matter", password: 'test')
    expect { Relation.create(book_id: 1, user_id: 1) }
      .to(change { Relation.count })
  end

  it 'can\'t have two identical records' do
    Relation.create(book_id: 1, user_id: 1)
    expect(Relation.new(book_id: 1, user_id: 1)).not_to be_valid
  end
end

require 'rails_helper'

RSpec.describe Book, type: :model do
  before(:each) {Book.delete_all}
  it 'should add new records' do 
    expect {Book.create(name: 'test name', author: 'test author', publishing_house: 'test ph', year: 2020, isbn: 'doesn\'t matter') }
      .to(change { Book.count })
  end
  
  it 'can\'t have two identical records' do 
    Book.create(name: 'test name', author: 'test author', publishing_house: 'test ph', year: 2020, isbn: 'doesn\'t matter')
    expect(Book.new(name: 'test name', author: 'test author', publishing_house: 'test ph', year: 2020, isbn: 'doesn\'t matter')).not_to be_valid
  end
end
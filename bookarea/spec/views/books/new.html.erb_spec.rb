# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/new', type: :view do
  before(:each) do
    assign(:book, Book.new(
                    name: 'MyString',
                    author: 'MyString',
                    publishing_house: 'MyString',
                    year: 1,
                    isbn: 'MyString'
                  ))
  end

  it 'renders new book form' do
    render

    assert_select 'form[action=?][method=?]', books_path, 'post' do
      assert_select 'input[name=?]', 'book[name]'

      assert_select 'input[name=?]', 'book[author]'

      assert_select 'input[name=?]', 'book[publishing_house]'

      assert_select 'input[name=?]', 'book[year]'

      assert_select 'input[name=?]', 'book[isbn]'
    end
  end
end

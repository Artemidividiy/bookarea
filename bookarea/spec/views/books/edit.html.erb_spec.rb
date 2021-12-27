require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      name: "MyString",
      author: "MyString",
      publishing_house: "MyString",
      year: 1,
      isbn: "MyString"
    ))
  end

  it "renders the edit book form" do
    render

    assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[name]"

      assert_select "input[name=?]", "book[author]"

      assert_select "input[name=?]", "book[publishing_house]"

      assert_select "input[name=?]", "book[year]"

      assert_select "input[name=?]", "book[isbn]"
    end
  end
end

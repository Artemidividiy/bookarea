require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      name: "Name",
      author: "Author",
      publishing_house: "Publishing House",
      year: 2,
      isbn: "Isbn"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Publishing House/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Isbn/)
  end
end

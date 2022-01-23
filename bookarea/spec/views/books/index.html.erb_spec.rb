# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'books/index', type: :view do
  before(:each) do
    assign(:books, [
             Book.create!(
               name: 'Name',
               author: 'Author',
               publishing_house: 'Publishing House',
               year: 2,
               isbn: 'Isbn'
             ),
             Book.create!(
               name: 'Name',
               author: 'Author',
               publishing_house: 'Publishing House',
               year: 2,
               isbn: 'Isbn2'
             )
           ])
  end

  it 'renders a list of books' do
    render
    expect(rendered).to include('Isbn', 'Isbn2')
  end
end

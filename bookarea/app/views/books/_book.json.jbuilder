json.extract! book, :id, :name, :author, :publishing_house, :year, :isbn, :created_at, :updated_at
json.url book_url(book, format: :json)

# frozen_string_literal: true

# class that defines books controller
class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy like unlike]
  def input; end

  # GET /books or /books.json
  def index
    @books = Book.all
  end

  # GET /books/1 or /books/1.json
  def show; end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit; end

  def unlike
    current_user.books.delete @book
  end

  def like
    current_user.books << @book
    # Relation.create(user_id: current_user.id, book_id: @book.id)
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)
    respond_to do |format|
      if @book.save
        current_user.books << @book
        format.html { redirect_to book_url(@book), notice: t('messages.book_was_successfully_created') }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to book_url(@book), notice: 'Book was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url, notice: t('messages.book_was_successfully_destroyed') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:name, :author, :publishing_house, :year, :isbn)
  end
end

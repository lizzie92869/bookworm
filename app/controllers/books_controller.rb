class BooksController < ApplicationController
  include BasicJson

  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
    render_json_and_html(@books)
  end

  def show
    render_json_and_html(@book)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book.destroy if @book
    redirect_to books_path
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(
      :title,
      :book_code,
      :description,
      :cover_image,
      :chapter_attributes => []
    )
  end
end

# ChaptersController
class ChaptersController < ApplicationController
  include BasicJson

  before_action :set_chapter, only: %i[show edit update destroy]

  def index
    @chapters = Chapter.all
    render_json_and_html(@chapter)
  end

  def show
    @book = Book.find_by_id(params[:book_id])
    render_json_and_html(@chapter)
  end

  def new
    @chapter = Chapter.new(book_id: params[:book_id])
  end

  def create
    @chapter = Chapter.new(chapter_params)
    if @chapter.save
      redirect_to book_chapter_path(@chapter.book_id, @chapter.chapter_number)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @chapter.update(chapter_params)
      redirect_to book_chapter_path(@chapter.book_id, @chapter.chapter_number)
    else
      render :edit
    end
  end

  def destroy
    bookid = @chapter.book_id
    @chapter.destroy if @chapter
    redirect_to book_chapters_path(bookid)
  end

  private

  def set_chapter
    @chapter = Chapter.find_by(book_id: params[:book_id],
                               chapter_number: params[:id])
  end

  def chapter_params
    params.require(:chapter).permit(
      :chapter_title,
      :book_id,
      :language,
      :status,
      :release_date,
      :content,
      :chapter_number
    )
  end
end

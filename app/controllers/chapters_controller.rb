class ChaptersController < ApplicationController
    include BasicJson

    before_action :set_chapter, only: [:show, :edit, :update, :destroy]

    def index
      @chapter = Chapter.all
      render_json_and_html(@chapter)
    end

    def show
      render_json_and_html(@chapter)
    end

    def new
      @chapter = Chapter.new
    end

    def create
      @chapter = Chapter.new(chapter_params)
      if @chapter.save
        redirect_to chapter_path(@chapter)
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @chapter.update(chapter_params)
        redirect_to chapter_path(@chapter)
      else
        render :edit
      end
    end

    def destroy
      @chapter.destroy if @chapter
      redirect_to chapters_path
    end

    private

    def set_book
      @chapter = Chapter.find(params[:id])
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

end

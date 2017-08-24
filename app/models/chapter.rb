class Chapter < ApplicationRecord
  belongs_to :book, dependent: :destroy

  validates_presence_of :chapter_number, :release_date, :content

  #overwrite param from id to chapter_number
  #due to rails router bug, have to
  # book_chapter_path(@book, @chapter.chapter_number) for it to properly work
  # else it throws nomethoderror .emtpy?
  # to_param still correctly sets url route /books/:book_id/chapters/:chapter_number
  def to_param
    chapter_number
  end
end

class Chapter < ApplicationRecord
  #counter_cache use the chapters_count column in table
  #only works for newly added/removed records, have to recalc if existing records
  #use following Book.find_each { |c| Book.reset_counters(c.id, :chapters)}
  #this will update to correct values
  belongs_to :book, dependent: :destroy, :counter_cache => true

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

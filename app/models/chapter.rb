class Chapter < ApplicationRecord
  belongs_to :book, dependent: :destroy

  validates_presence_of :chapter_number, :release_date, :content

  #overwrite param from id to chapter_number
  def to_param
    chapter_number
  end
end

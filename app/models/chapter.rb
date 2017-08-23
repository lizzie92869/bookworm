class Chapter < ApplicationRecord
  belongs_to :book

  validates_presence_of :chapter_number, :release_date, :content

  
end

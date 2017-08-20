class Book < ApplicationRecord
  validates_presence_of :title, :book_code

  validates :title, length: { in: 3..256, wrong_length: "Title must be between 3 and 256 characters" }
  validates :book_code, length: { in: 3..80, wrong_length: "Book Code must be between 3 and 80 characters" },
                        uniqueness: { case_sensitive: false }

  validates :description, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed for description" },
                          allow_blank: true

  
end

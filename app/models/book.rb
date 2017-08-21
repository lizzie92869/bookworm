class Book < ApplicationRecord
  #paperclip
  has_attached_file :cover_image, styles: { medium: "300x300", thumb: "75x150" },
                                  default_url: "black-noimg.jpg"

  validates_attachment_content_type :cover_image, content_type: /\Aimage\/.*\z/

  validates_presence_of :title, :book_code

  validates :title,       length: { in: 3..256, wrong_length: "Title must be between 3 and 256 characters" }
  validates :book_code,   length: { in: 3..80, wrong_length: "Book Code must be between 3 and 80 characters" },
                          uniqueness: { case_sensitive: false }

  validates :description, length: { maximum: 500, too_long: "%{count} characters is the maximum allowed for description" },
                          allow_blank: true

  #scopes (chainable class methods)
  #have the if <>.present? on any input
  #you will have to override this order with reorder(colum: :direction)
  default_scope { order(created_at: :desc) }

  scope :by_book_code, ->(book_code) { where(book_code: book_code) if book_code.present? }
  #search by title
  scope :by_title, ->(title) { where('title LIKE ?', "%#{title}%") if title.present? }

  #should these be moved?
  scope :order_by_title_asc, -> { reorder(title: :asc) }
  scope :order_by_title_desc, -> { reorder(title: :desc) }
end

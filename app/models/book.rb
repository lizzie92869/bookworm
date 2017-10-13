# Book
class Book < ApplicationRecord
  has_many :chapters

  # paperclip
  has_attached_file :cover_image,
                    styles: { medium: '300x300', thumb: '75x150' },
                    default_url: ''

  validates_attachment_content_type :cover_image, content_type: %r{\Aimage\/.*\z}

  validates_presence_of :title, :book_code

  validates :title, length: { in: 3..256 }
  validates :book_code, length: { in: 3..80 },
                        uniqueness: { case_sensitive: false }

  validates :description, length: { maximum: 500 },
                          allow_blank: true

  # scopes (chainable class methods)
  # have the if <>.present? on any input
  # you will have to override this order with reorder(colum: :direction)
  default_scope { order(created_at: :desc) }

  scope :by_book_code, ->(book_code) { where(book_code: book_code) if book_code.present? }
  # search by title, made to be case insensitive
  scope :by_title, ->(title) { where('UPPER(title) LIKE UPPER(?)', "%#{title}%") if title.present? }

  # should these be moved?
  scope :order_by_title_asc, -> { reorder(title: :asc) }
  scope :order_by_title_desc, -> { reorder(title: :desc) }
end

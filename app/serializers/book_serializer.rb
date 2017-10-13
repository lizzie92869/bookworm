# book Serializer
class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :book_code, :description, :cover_image

  has_many :chapters

  # any way to get chapters to only be pulled when specific chapter is defined
  # as in /books.json = no chapters
  # but /books/11.json = chapters for that book
end

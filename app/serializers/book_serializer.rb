class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :book_code, :description, :cover_image
end

# chapter Serializer
class ChapterSerializer < ActiveModel::Serializer
  attributes :id, :chapter_title, :book_id, :chapter_number, :content
end

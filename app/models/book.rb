class Book < ApplicationRecord
  validates_presence_of :title, :book_code

  
end

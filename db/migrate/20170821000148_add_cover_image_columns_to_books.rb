class AddCoverImageColumnsToBooks < ActiveRecord::Migration[5.1]
  def change
    add_attachment :books, :cover_image
  end
end

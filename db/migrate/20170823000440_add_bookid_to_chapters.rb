class AddBookidToChapters < ActiveRecord::Migration[5.1]
  def change
    add_column :chapters, :book_id, :integer
  end
end

class AddChapterCountToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :chapters_count, :integer
  end
end

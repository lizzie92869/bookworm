class CreateChapters < ActiveRecord::Migration[5.1]
  def change
    create_table :chapters do |t|
      t.string :chapter_title
      t.string :language, default: 'en'
      t.string :status, default: 'unpublished'
      t.datetime :release_date
      t.string :content
      t.integer :chapter_number
      t.timestamps
    end
  end
end

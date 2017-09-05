class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :book_code
      t.string :description
      t.timestamps
    end

    #force book_code to be unique
    add_index :books, :book_code, unique: true
  end
end

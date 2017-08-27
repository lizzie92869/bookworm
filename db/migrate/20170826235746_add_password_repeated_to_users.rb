class AddPasswordRepeatedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :password_repeated, :string
  end
end

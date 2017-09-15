class FixPasswordRepeated < ActiveRecord::Migration[5.1]
  def change
  	 rename_column :users, :password_repeated, :password_confirmation
  end
end

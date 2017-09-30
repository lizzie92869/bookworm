class RemoveRememberPasswordFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :remember_password, :string
  end
end

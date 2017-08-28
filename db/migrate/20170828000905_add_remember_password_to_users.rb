class AddRememberPasswordToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :remember_password, :string
  end
end

class RemoveVerificationCodeFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :verification_code, :integer
  end
end

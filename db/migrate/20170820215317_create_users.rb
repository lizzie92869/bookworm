class CreateUsers < ActiveRecord::Migration[5.1]
  def change
	  create_table :users do |t|
	      t.string :name
	      t.string :email
	      t.string :role, default: 1
	      t.string :password_digest
	      t.string :uid 
	      t.integer :verification_code
	      t.boolean :verified, default: false
	      t.timestamps null: false
    end
  end
end

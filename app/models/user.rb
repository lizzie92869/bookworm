class User < ActiveRecord::Base
  has_secure_password

  validates :name, :presence 	 => true,
  			:length			 	 => {:maximum => 30},
  validates :email, :presence 	 => true,
  			:format	 		 	 => {:with => email_regex},
  			:uniqueness			 => {:case_sensitive => false}
  validates :password, :presence => true,
  			:length			 	 => {:maximum => 30},
  validates :password_repeated, :presence => true,

  

end
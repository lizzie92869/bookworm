class User < ActiveRecord::Base
  has_secure_password

  # validates :name, :presence 	 => true,
  # 			:length			 	 => {:maximum => 30},
  # validates :email, :presence 	 => true,
  # 			:format	 		 	 => {:with => email_regex},
  # 			:uniqueness			 => {:case_sensitive => false},
  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :password, :presence => true,
  # 			:length			 	 => {:maximum => 30, :minimum => 6},
  # validates :password_repeated, :presence => true,

  
has_secure_password

# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

end
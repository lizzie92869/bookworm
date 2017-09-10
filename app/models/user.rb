class User < ActiveRecord::Base
  has_secure_password
  before_create :confirmation_token

# before_save { self.email = email.downcase }
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# validates :email, presence: true, length: { maximum: 30 },
#                     format: { with: VALID_EMAIL_REGEX },
#                     uniqueness: { case_sensitive: false }
# validates :name, presence: true, uniqueness:true, length: { maximum: 30 }                 
# validates :password, presence: true, length: { maximum: 30, minimum: 6 }
# validates :password_repeated, presence: true

  
has_secure_password

private
def confirmation_token
      if self.confirm_token.blank?
          self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end

end
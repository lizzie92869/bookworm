
class User < ActiveRecord::Base
  before_create :confirmation_token
  before_save { self.email = email.downcase }
  has_secure_password
  

# before_save { self.email = email.downcase }
# VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# validates :email, presence: true, length: { maximum: 30 },
#                     format: { with: VALID_EMAIL_REGEX },
#                     uniqueness: { case_sensitive: false }
# validates :name, presence: true, uniqueness:true, length: { maximum: 30 }                 
validates :password, presence: true, length: { maximum: 30, minimum: 6 }, confirmation: true
  validates :password_confirmation, presence: true



 # confirm the email   
def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end 


private
  # return a random token to verify the email
  def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
      end

end
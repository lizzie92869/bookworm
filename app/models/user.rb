
class User < ActiveRecord::Base
  has_secure_password
  before_save { self.email = email.downcase }
  before_create :confirmation_token
  
  
  

before_save { self.email = email.downcase }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
# validates :email, presence: true, length: { maximum: 30 },
#                     format: { with: VALID_EMAIL_REGEX },
#                     uniqueness: { case_sensitive: false }
validates :name, presence: true, uniqueness:true, length: { maximum: 30 }                 
  # validates :password, length: { maximum: 30, minimum: 6 }



 # confirm the email   
def email_activate
    self.email_confirmed = true
    save!(:validate => false)
  end 

def send_password_reset
  generate_token(:password_reset_token)
  self.password_reset_sent_at = Time.zone.now
  save!
  UserMailer.password_reset(self).deliver
end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end


private
  # return a random token to verify the email
  def confirmation_token
        if self.confirm_token.blank?
            self.confirm_token = SecureRandom.urlsafe_base64.to_s
        end
      end

# return true if the user is authenticated with a cookie
def authenticated_with_token?(token)
   if (token == self.remember_digest)
    return true
   end
 end

end
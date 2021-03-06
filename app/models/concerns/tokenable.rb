# Tokenable
module Tokenable
  extend ActiveSupport::Concern

  included do
    attr_accessor :auth_token
  end

  def remember
    self.auth_token = User.new_token
    update_attribute(:remember_digest, User.digest(:auth_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  # Returns true if given token matches the digest
  def authenticated_cookie?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # ClassMethods
  module ClassMethods
    # Returns hash digest of given string
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token
    def new_token
      SecureRandom.urlsafe_base64
    end
  end
end

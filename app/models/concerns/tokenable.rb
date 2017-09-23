# Returns true if given token matches the digest
  def authenticated_cookie?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
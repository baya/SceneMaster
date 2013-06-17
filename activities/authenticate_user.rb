class AuthenticateUser < Ground::Activity
  include Protocol::Find
  
  data_reader :email, :password

  def call
    user = find_user_by(:email, email)
    return user if user and password_match?(user)
  end

  private

  def password_match?(user)
    user[:password_hash] == BCrypt::Engine.hash_secret(password, user[:password_salt])
  end
  
end

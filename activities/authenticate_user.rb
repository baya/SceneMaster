class AuthenticateUser < Ground::Activity
  include Protocol::CRUD::Find
  
  data_reader :name, :password

  def call
    user = find_user_by(:name, name)
    return user if user and password_match?(user)
  end

  private

  def password_match?(user)
    user[:password_hash] == BCrypt::Engine.hash_secret(password, user[:password_salt])
  end
  
end

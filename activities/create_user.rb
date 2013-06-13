class CreateUser < Ground::Activity
  data_reader :email, :password, :password_confirmation

  def call
    id = db[:users].insert user
    user.merge(id: id)
  end

  private

  def user
    get_or_set :user do
      password_salt = BCrypt::Engine.generate_salt
      password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      {email: email, password_hash: password_hash, password_salt: password_salt}
    end
  end

  def db
    SceneMaster::DB
  end
  
end

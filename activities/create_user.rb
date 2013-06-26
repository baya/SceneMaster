class CreateUser < Ground::Activity
  include Protocol::CRUD
  
  data_reader :name, :password, :password_confirmation

  def call
    id = db[:users].insert user
    user.merge(id: id)
  end

  private

  def user
    get_or_set :user do
      password_salt = BCrypt::Engine.generate_salt
      password_hash = BCrypt::Engine.hash_secret(password, password_salt)
      {name: name, password_hash: password_hash, password_salt: password_salt}
    end
  end

end

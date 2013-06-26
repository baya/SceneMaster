module Session

  class SignUp < Ground::State

    def call
      errors = ValidateUser params[:user]
      return not_accept(errors) if errors.size > 0
      
      @user = CreateUser params[:user]
      session[:user_idl] = @user[:id]
      redirect Scene::Index.path
    end
    
  end

end

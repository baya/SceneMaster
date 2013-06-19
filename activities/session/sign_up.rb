module Session

  class SignUp < Ground::State

    def call
      @errors = ValidateUser params[:user]
      if @errors.size > 0
        text @errors.inspect
      else
        @user = CreateUser params[:user]
        session[:user_email] = @user[:email]
        redirect Scene::Index.path
      end
    end
    
  end

end

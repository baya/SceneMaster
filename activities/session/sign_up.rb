module Session
  SignUp = Ground::Ridge(path: '/sign_up', verb: 'post')

  class SignUp

    def call
      @user = CreateUser params[:user]
      if @user
        session[:user_email] = @user[:email]
      end
      redirect Scene::Index.path
    end
    
  end
  
end

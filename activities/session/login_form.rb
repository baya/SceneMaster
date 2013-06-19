module Session
  

  class LoginForm < Ground::State

    def call
      haml 'session/login_form'
    end
    
  end

end  

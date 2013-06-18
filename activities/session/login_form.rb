module Session
  

  class LoginForm < Ground::State

    def call
      haml 'session/login_form'
    end
    
  end

  Ground::Ridge path: '/login', verb: 'get', state: LoginForm
  
end  

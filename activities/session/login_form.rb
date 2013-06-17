module Session
  LoginForm = Ground::Ridge path: '/login', verb: 'get'

  class LoginForm

    def call
      haml 'session/login_form'
    end
    
  end
  
end  

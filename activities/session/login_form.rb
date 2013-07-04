module Session
  
  class LoginForm < Ground::State

    include Protocol::Current

    def call
      html content
    end

    private

    def content
      haml 'session/login_form'
    end
    
  end

end  

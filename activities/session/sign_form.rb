module Session
  SignForm = Ground::Ridge(path: '/sign_up', verb: 'get')

  class SignForm

    def call
      haml 'session/sign_form'
    end
    
  end
  
end

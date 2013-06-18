module Session

  class SignForm < Ground::State

    def call
      haml 'session/sign_form'
    end
    
  end

  Ground::Ridge path: '/sign_up', verb: 'get', state: SignForm
  
end

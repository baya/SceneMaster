module Session

  class SignForm < Ground::State

    def call
      haml 'session/sign_form'
    end
    
  end

end

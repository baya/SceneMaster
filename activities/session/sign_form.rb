module Session

  class SignForm < Ground::State

    def call
      html content
    end

    private

    def content
      haml 'session/sign_form'
    end
    
  end

end

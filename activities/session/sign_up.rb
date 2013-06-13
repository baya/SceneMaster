module Session
  SignUp = Ground::Ridge(path: '/sign_up', verb: 'post')

  class SignUp

    def call
      puts "++++++++++++++++++#{params.inspect}"
    end
    
  end
  
end

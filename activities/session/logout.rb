module Session

  class Logout < Ground::State

    def call
      session[:user_email] = nil
      redirect Scene::Index.path
    end
    
  end

  Ground::Ridge path: '/logout', verb: 'get', state: Logout
  
end

module Session

  class Logout < Ground::State

    def call
      session[:user_id] = nil
      redirect Scene::Index.path
    end
    
  end

end

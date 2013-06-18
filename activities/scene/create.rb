module Scene
  

  class Create < Ground::State

    def call
      CreateScene params[:scene]
      redirect Scene::Index.path
    end
    
  end

  Ground::Ridge path: '/scene', verb: 'post', state: Create
  
end

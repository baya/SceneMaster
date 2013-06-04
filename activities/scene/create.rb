module Scene
  Create = Ground::Ridge(path: '/scene', verb: 'post')

  class Create

    def call
      CreateScene params[:scene]
      redirect Scene::Index.path
    end
    
  end
  
end

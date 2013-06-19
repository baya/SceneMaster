module Scene
  

  class Create < Ground::State

    def call
      CreateScene params[:scene]
      redirect Scene::Index.path
    end
    
  end

end

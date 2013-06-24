module Scene
  
  class Create < Ground::State

    include Protocol::CRUD
    include Protocol::Current

    def call
      return unauthorized if current_user.nil?
      errors = ValidateScene(params[:scene])
      return(not_accept errors) if errors.size > 0
      
      @scene = CreateScene params[:scene]
      redirect Scene::Index.path
    end
    
  end

end

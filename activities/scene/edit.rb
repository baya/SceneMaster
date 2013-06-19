module Scene

  class Edit < Ground::State

    include Protocol::CRUD::Find

    def call
      @scene = find_scene_by_id(params[:id])
      @activities = find_activities_of_scene(@scene)
      haml 'scene/edit'
    end
    
  end
  
end

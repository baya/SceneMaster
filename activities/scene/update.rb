module Scene

  class Update < Ground::State
    include Protocol::CRUD::Find
    include Protocol::Current

    def call
      return unauthorized if current_user.nil?
      scene = current_scene(params[:id])
      return forbid if not scene

      scene = scene.merge(params)
      errors = ValidateScene scene
      return json(errors.to_json, 406) if errors.size > 0

      @scene = UpdateScene scene

      json @scene.to_json

    end
    
  end
  
end

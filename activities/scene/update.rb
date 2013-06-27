module Scene

  class Update < Ground::State
    include Protocol::CRUD::Find

    def call
      return unauthorized if current_user.nil?
      @scene = current_scene(params[:id])
      return forbid if not @scene

      
    end
    
  end
  
end

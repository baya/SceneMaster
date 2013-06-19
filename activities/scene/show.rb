module Scene

  class Show < Ground::State

    include Protocol::Find

    def call
      @scene = find_scene_by_id(params[:id])
      @activities = find_activities_of_scene(@scene)
      haml 'scene/show'
    end

  end

end

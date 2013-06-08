module Scene
  Show = Ground::Ridge(path: '/scene/:id', verb: 'get')

  class Show

    include Protocol::Find

    def call
      @scene = find_scene_by_id(params[:id])
      @activities = find_activities_of_scene(@scene)
      haml 'scene/show'
    end

  end
  
end

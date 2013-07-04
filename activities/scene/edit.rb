module Scene

  class Edit < Ground::State

    include Protocol::CRUD::Find
    include Protocol::Current

    def call
      return unauthorized if current_user.nil?
      @scene = current_scene(params[:id])
      return forbid if not @scene
      
      activities = find_activities_of_scene(@scene)
      @activities = SortActivities activities: activities, scene_id: @scene[:id]
      html content
    end

    private

    def content
      haml 'layout/app' do
        haml 'scene/edit'
      end
    end

  end
  
end

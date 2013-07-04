module Scene

  class Show < Ground::State

    include Protocol::CRUD::Find
    include Protocol::Current

    def call
      @scene = find_scene_by_id(params[:id])
      activities = find_activities_of_scene(@scene)
      @activities = SortActivities activities: activities, scene_id: @scene[:id]

      html content
    end

    private

    def content
      haml 'layout/app' do
        haml 'scene/show'
      end
    end

  end

end

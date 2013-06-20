class CreateActivity < Ground::Activity

  include Protocol::CRUD
  
  data_reader :scene_id, :role, :action, :content

  def call
    id = db[:activities].insert activity
    activity.merge(id: id)
  end

  private

  def activity
    @activity ||= {
      scene_id: scene_id,
          role: role,
        action: action,
       content: content
    }
  end
  
end

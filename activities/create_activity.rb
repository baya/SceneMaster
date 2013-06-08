class CreateActivity < Ground::Activity
  
  data_reader :scene_id, :role, :action, :content

  def call
    errors = ValidateActivity data
    return errors if errors.size > 0
    
    id = db[:activities].insert activity
    
    activity.merge(id: id)
  end

  private

  def db
    SceneMaster::DB
  end

  def activity
    @activity ||= {
      scene_id: scene_id,
          role: role,
        action: action,
       content: content
    }
  end
  
end

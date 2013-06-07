class CreateScene < Ground::Activity

  data_reader :name, :activities

  def call
    errors = ValidateScene(name: name)
    return errors if errors.size > 0
    scene_id = db[:scenes].insert(name: name)
    activities.each {|activity|
      errors = ValidateActivity activity
      next if errors.size > 0
      db[:activities].insert(   role: activity[:role],
                                action: activity[:action],
                                content: activity[:content],
                                scene_id: scene_id
                                )
    }
    scene_id
  end

  private
  
  def db
    SceneMaster::DB
  end

end

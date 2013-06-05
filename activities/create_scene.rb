class CreateScene < Ground::Activity

  data_reader :name, :activities

  def call
    scene_id = db[:scenes].insert(name: name)
    activities.each {|activity|
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

module Protocol
  
  module Find

    private
    
    def db
      SceneMaster::DB
    end

    def find_activities_of_scene(scene)
      db[:activities].where('scene_id IN (?)', scene[:id]).order(:id)
    end

    def find_scene_by_id(id)
      db[:scenes].where(id: id).first
    end

    def find_last_scenes(num)
      db[:scenes].order(Sequel.desc :id).limit(num)
    end

    def find_user_by(col, value)
      db[:users].where(col => value).first
    end

  end
  
end

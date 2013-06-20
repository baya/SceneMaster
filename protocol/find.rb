module Protocol::CRUD
  
  module Find

    include Protocol::CRUD

    def find_activities_of_scene(scene)
      db[:activities].where('scene_id IN (?)', scene[:id])
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

    def find_sort_array_by_scene_id(scene_id)
      db[:sort_arrays].where(scene_id: scene_id).first
    end

  end
  
end

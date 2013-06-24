module Protocol

  module Current

    def current_user
      db[:users].where(id: session[:user_id]).first
    end

    def current_scene(scene_id)
      db[:scenes].
        where(id: scene_id, user_id: current_user[:id]).
        where('user_id is not null').
        first
    end

  end
  
end

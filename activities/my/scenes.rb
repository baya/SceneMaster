module My

  class Scenes < Ground::State
    
    include Protocol::CRUD::Find
    include Protocol::Current

    def call
      return unauthorized if current_user.nil?
      @scenes = db[:scenes].where(user_id: current_user[:id])

      haml 'my/index'
    end
    
  end
  
end

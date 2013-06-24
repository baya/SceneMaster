module Activity
  
  class Create < Ground::State
    
    include Protocol::CRUD::Find
    include Protocol::CRUD::Update
    include Protocol::Current

    def call
      errors = ValidateActivity params
      return unauthorized if current_user.nil?
      
      @scene = current_scene(params[:scene_id])
      return forbid if @scene.nil?

      if errors.size > 0
        json({error: errors}.to_json)
      else
        activity = CreateActivity params
        sort_array_data = params[:sort_array].insert(params[:position].to_i, activity[:id])
        
        sort_array = find_sort_array_by_scene_id(params[:scene_id])
        if sort_array
          update_sort_array(sort_array[:id], sort_array_data)
        else
          CreateSortArray params.merge(:sort_array_data => sort_array_data)
        end
        
        json activity.to_json
      end
      
    end

  end

end

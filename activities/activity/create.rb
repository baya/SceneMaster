module Activity
  
  class Create < Ground::State
    include Protocol::CRUD::Find

    def call
      errors = ValidateActivity params
      if errors.size > 0
        json({error: errors}.to_json)
      else
        activity = CreateActivity params
        sort_array_data = params[:sort_array].insert(position, activity[:id])
        
        sort_array = find_sort_array_by_scene_id(params[:scene_id])
        if sort_array
          update_sort_array(sort_array[:id], sort_array_data)
        else
          create_sort_array(sort_array_data)
        end
        
        json activity.to_json
      end
    end

    private

    def position
      params[:position].to_i
    end

    def update_sort_array(id, sort_array_data)
      db[:sort_arrays].where(id: id).update(content: sort_array_data.join(','))
    end

    def create_sort_array(sort_array_data)
      CreateSortArray params.merge(:sort_array_data => sort_array_data)
    end

  end

end

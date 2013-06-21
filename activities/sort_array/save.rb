module SortArray

  class Save < Ground::State

    include Protocol::CRUD::Find
    include Protocol::CRUD::Update

    def call
      sort_array = find_sort_array_by_scene_id(params[:scene_id])
      sort_array_data = params[:sort_array]
      
      if sort_array
        update_sort_array(sort_array[:id], sort_array_data)
      else
        sort_array = CreateSortArray params.merge(:sort_array_data => sort_array_data)
      end

      json sort_array.to_json
    end
    
  end

end

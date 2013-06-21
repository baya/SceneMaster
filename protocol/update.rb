module Protocol::CRUD
  module Update
    include Protocol::CRUD
    
    def update_sort_array(id, sort_array_data)
      db[:sort_arrays].where(id: id).update(content: sort_array_data.join(','))
    end

  end
end

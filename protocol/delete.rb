module Protocol::CRUD
  module Delete
    include Protocol::CRUD

    def delete_activity_by_id(id)
      db[:activities].where(id: id).delete
    end
    
  end
end

module Protocol
  module Delete

    private

    def db
      SceneMaster::DB
    end
    
    def delete_activity_by_id(id)
      db[:activities].where(id: id).delete
    end
    
  end
end

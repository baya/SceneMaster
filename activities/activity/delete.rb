module Activity

  class Delete < Ground::State

    include Protocol::CRUD::Delete

    def call
      delete_activity_by_id(params[:id])
      json({result: 'success'}.to_json)
    end
    
  end
  
end

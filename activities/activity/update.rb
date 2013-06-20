module Activity
  
  class Update < Ground::State

    def call
      errors = ValidateActivity params
      if errors.size > 0
        json({error: errors}.to_json)
      else
        activity = UpdateActivity params
        json activity.to_json
      end
    end
    
  end

end

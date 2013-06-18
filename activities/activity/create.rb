module Activity
  

  class Create < Ground::State

    def call
      res = CreateActivity params
      json res.to_json
    end
    
  end

  Ground::Ridge path: '/activity', verb: 'post', state: Create
  
end

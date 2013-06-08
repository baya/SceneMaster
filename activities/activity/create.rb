module Activity
  Create = Ground::Ridge(path: '/activity', verb: 'post')

  class Create

    def call
      res = CreateActivity params
      json res
    end
    
  end
  
end

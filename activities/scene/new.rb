module Scene
  New = Ground::Ridge(path: '/scene/new', verb: 'get')

  class New

    def call
      response['Content-Type'] = 'text/html; charset=UTF-8'
      haml 'scene/new'
    end

  end
  
end

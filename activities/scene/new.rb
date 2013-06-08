module Scene
  New = Ground::Ridge(path: '/scene/new', verb: 'get')

  class New

    def call
      haml 'scene/new'
    end

  end
  
end

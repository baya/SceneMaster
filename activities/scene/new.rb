module Scene

  class New < Ground::State

    def call
      haml 'scene/new'
    end

  end

  Ground::Ridge path: '/scene/new', verb: 'get', state: New
  
end

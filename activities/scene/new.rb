module Scene

  class New < Ground::State

    def call
      haml 'scene/new'
    end

  end

end

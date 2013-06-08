# -*- coding: utf-8 -*-
module Scene
  Index = Ground::Ridge(path: '/scenes', verb: 'get')

  class Index

    include Protocol::Find

    def call
      @scenes = find_last_scenes(20)
      haml 'scene/index'
    end

  end
  
end

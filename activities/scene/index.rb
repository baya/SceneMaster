# -*- coding: utf-8 -*-
module Scene

  class Index < Ground::State

    include Protocol::CRUD::Find

    def call
      @scenes = find_last_scenes(20)
      haml 'scene/index'
    end

  end

end

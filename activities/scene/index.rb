# -*- coding: utf-8 -*-
module Scene

  class Index < Ground::State

    include Protocol::CRUD::Find
    include Protocol::Current

    def call
      @scenes = find_all_public_scenes
      haml 'scene/index'
    end

    private

    def find_all_public_scenes
      db[:scenes].where(pub: true).order(Sequel.desc :id)
    end

  end

end

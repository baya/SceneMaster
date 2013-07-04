# -*- coding: utf-8 -*-
module Scene

  class Index < Ground::State

    include Protocol::CRUD::Find
    include Protocol::Current

    def call
      @scenes = find_all_public_scenes
      html content
    end

    private

    def find_all_public_scenes
      db[:scenes].where(pub: true).order(Sequel.desc :id)
    end

    def content
      haml 'layout/app' do
        haml 'scene/index'
      end
    end

  end

end

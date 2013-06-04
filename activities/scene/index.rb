# -*- coding: utf-8 -*-
module Scene
  Index = Ground::Ridge(path: '/scenes', verb: 'get')

  class Index

    def call
      response['Content-Type'] = 'text/html; charset=UTF-8'
      @scenes = find_last_scenes(20)
      haml 'scene/index'
    end

    private

    def find_last_scenes(num)
      SceneMaster::DB[:scenes].order(Sequel.desc :id).limit(num)
    end

  end
  
end

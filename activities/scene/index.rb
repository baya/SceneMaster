# -*- coding: utf-8 -*-
module Scene
  Index = Ground::Ridge(path: '/scenes', verb: 'get')

  class Index

    def call
      response['Content-Type'] = 'text/html; charset=UTF-8'
      @scenes = find_last_scenes(20)
      @activities = find_activities_of_scenes(@scenes)
      haml 'scene/index'
    end

    private

    def find_last_scenes(num)
      db[:scenes].order(Sequel.desc :id).limit(num)
    end

    def find_activities_of_scenes(scenes)
      db[:activities].where('scene_id IN ?', scenes.select(:id)).order(:id)
    end

    def db
      SceneMaster::DB
    end

  end
  
end

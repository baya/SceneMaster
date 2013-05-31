# -*- coding: utf-8 -*-
module Scene
  Index = Ground::Ridge(path: '/scenes', verb: 'get')

  class Index

    def call
      response['Content-Type'] = 'text/html; charset=UTF-8'
      @scenes = find_last_scenes(5)
      haml 'scene/index'
    end

    private

    def views
      File.expand_path File.join(ROOT_DIR, 'views')
    end

    def haml(path)
      template = Tilt::HamlTemplate.new(File.join(views, "#{path}.haml"))
      output = template.render(self)
      response.write(output)
      response.finish
    end

    def find_last_scenes(num)
      DB[:scenes].order(:id).limit(num)
    end

  end
  
end

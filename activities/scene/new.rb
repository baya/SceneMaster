module Scene
  New = Ground::Ridge(path: '/scene/new', verb: 'get')

  class New

    def call
      response['Content-Type'] = 'text/html; charset=UTF-8'
      haml 'scene/new'
    end


    private

    def haml(path)
      template = Tilt::HamlTemplate.new(File.join(views, "#{path}.haml"))
      output = template.render(self)
      response.write(output)
      response.finish
    end

    def views
      File.expand_path File.join(ROOT_DIR, 'views')
    end

  end
  
end

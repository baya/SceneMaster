Ground do

  module HtmlSafe
    
    def sanitize(text, level=nil)
      level ||= Sanitize::Config::BASIC
      Sanitize.clean(text, level)
    end

  end
  
  help :all_states do

    include HtmlSafe
    
    def h(text)
      Rack::Utils.escape_html(text)
    end

  end

  help UpdateScene,
  UpdateActivity,
  CreateScene,
  CreateActivity,
  CreateUser do
    
    include HtmlSafe

  end

end

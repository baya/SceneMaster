# -*- coding: utf-8 -*-
module Session
  
  class Login < Ground::State

    def call
      user = AuthenticateUser params[:user]
      if user
        session[:user_id] = user[:id]
        redirect Scene::Index.path
      else
        text '用户名或密码错误'
      end
    end
    
  end

end

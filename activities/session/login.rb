# -*- coding: utf-8 -*-
module Session
  Login = Ground::Ridge path: '/login', verb: 'post'
 
  class Login

    def call
      user = AuthenticateUser params[:user]
      if user
        session[:user_email] = user[:email]
        redirect Scene::Index.path
      else
        text '用户名或密码错误'
      end
    end
    
  end
  
end

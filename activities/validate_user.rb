# -*- coding: utf-8 -*-
class ValidateUser < Ground::Validate
  include Protocol::CRUD
  
  data_reader :name, :password, :password_confirmation

  def call
    validates :name, '用户名不能为空' do
      name.length > 0
    end

    validates :name, '用户名已经被注册' do
      db[:users].where(name: name).first.nil?
    end

    validates :password, '密码不能为空' do
      password.length > 0
    end

    validates :password_confirmation, '前后密码输入不一样' do
      password == password_confirmation
    end

    super
  end
  
end

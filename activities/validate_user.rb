# -*- coding: utf-8 -*-
class ValidateUser < Ground::Validate
  data_reader :email, :password, :password_confirmation

  def call
    validates :email, '邮箱不能为空' do
      email.length > 0
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

# -*- coding: utf-8 -*-
class ValidateActivity < Ground::Validate
  data_reader :role, :action, :content

  def call
    validates :role, '场景名不能为空' do
      role.length > 0 
    end
    
    validates :action, '动作不能为空' do
      action.length > 0
    end
    
    validates :content, '内容不能为空' do
      content.length > 0
    end
    
    super
  end
  
end

# -*- coding: utf-8 -*-
class ValidateScene < Ground::Validate
  data_reader :name

  def call
    validates :name, '场景名不能为空' do
      name.length > 0
    end
    super
  end
  
end

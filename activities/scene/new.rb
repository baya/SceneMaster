module Scene

  class New < Ground::State

    include Protocol::CRUD
    include Protocol::Current

    def call
      return unauthorized if current_user.nil?
      haml 'scene/new'
    end

  end

end

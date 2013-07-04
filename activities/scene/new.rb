module Scene

  class New < Ground::State

    include Protocol::CRUD
    include Protocol::Current

    def call
      return unauthorized if current_user.nil?
      html content
    end

    private

    def content
      haml 'layout/app' do
        haml 'scene/new'
      end
    end

  end

end

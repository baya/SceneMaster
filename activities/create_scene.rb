class CreateScene < Ground::Activity

  include Protocol::CRUD

  data_reader :name, :description, :pub, :user_id

  def initialize(data)
    super
    @pub = data[:pub] == '1' ? true : false
  end

  def call
    scene_id = db[:scenes].insert(scene)
    scene.merge(id: scene_id)
  end

  private

  def scene
    @scene ||= {
      name: name,
      description: description,
      pub: pub,
      user_id: user_id
    }
  end

end

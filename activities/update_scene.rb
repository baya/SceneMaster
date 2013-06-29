class UpdateScene < Ground::Activity

  include Protocol::CRUD
  data_reader :id, :name, :description

  def call
    scene_set = db[:scenes].where(id: id)
    scene_set.update(name: name, description: description)
    scene_set.first
  end

end

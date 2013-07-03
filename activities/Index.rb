class Index < Ground::State

  def call
    redirect Scene::Index.path
  end
  
end

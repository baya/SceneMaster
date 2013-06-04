class CreateScene < Ground::Activity

  data_reader :name, :description

  def call
    db[:scenes].insert(name: name, description: description)
  end

  private
  
  def db
    SceneMaster::DB
  end

end

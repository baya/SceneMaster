class CreateSortArray < Ground::Activity

  include Protocol::CRUD
  
  data_reader :sort_array_data, :scene_id

  def call
    id = db[:sort_arrays].insert sort_array
    sort_array.merge(id: id)
  end

  private

  def sort_array
    @sort_array ||= {
      scene_id: scene_id,
      content: sort_array_data.join(',')
    }
  end
  
end

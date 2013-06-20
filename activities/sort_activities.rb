class SortActivities < Ground::Activity
  include Protocol::CRUD::Find
  include Protocol::Sort
  
  data_reader :activities, :scene_id

  def call
    sort_array.size == 0 ? activities.order(:id) : sort_by_id_in_array(activities, sort_array)
  end

  private

  def sort_array
    get_or_set :sort_array do
      sort_array = find_sort_array_by_scene_id(scene_id)
      sort_array.nil? ? [] : sort_array[:content].split(',').map(&:to_i)
    end
  end
  
end

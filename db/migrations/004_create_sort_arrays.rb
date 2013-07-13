Sequel.migration do
  up do
    create_table(:sort_arrays) do
      primary_key :id
      Integer :scene_id, :null=>false
      String  :content
    end
  end

  down do
    drop_table(:sort_arrays)
  end
end

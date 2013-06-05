Sequel.migration do
  up do
    create_table(:activities) do
      primary_key :id
      Integer :scene_id
      String  :role,   :null=>false
      String  :action, :null=>false
      String  :content
    end
  end

  down do
    drop_table(:activities)
  end
end

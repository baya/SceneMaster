Sequel.migration do
  change do
    add_column :scenes, :user_id, Integer
    add_column :scenes, :description, String
    add_column :scenes, :pub, TrueClass, default: true, null: false
  end
end

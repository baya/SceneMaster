Sequel.migration do
  change do
    add_column :users, :name, String, size: 30
  end
end

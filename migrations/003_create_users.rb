Sequel.migration do
  up do
    create_table(:users) do
      primary_key :id
      String :email, :null=>false
      String :password_hash
      String :password_salt
    end
  end

  down do
    drop_table(:users)
  end
end

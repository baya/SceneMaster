Sequel.migration do
  up do
    alert_table :users do
      set_column_allow_null :email
    end
  end

  down do
    alert_table :users do
      set_column_not_null :email
    end
  end
end

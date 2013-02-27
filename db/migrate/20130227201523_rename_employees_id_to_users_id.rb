class RenameEmployeesIdToUsersId < ActiveRecord::Migration
  def up
  end
    rename_column :vacations, :employee_id, :user_id
  def down
  end
end

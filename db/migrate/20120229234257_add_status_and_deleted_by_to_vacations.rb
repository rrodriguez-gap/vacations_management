class AddStatusAndDeletedByToVacations < ActiveRecord::Migration
  def change
    add_column :vacations, :status, :integer, :default=>1
	  add_column :vacations, :deleted_by, :integer
  end
end
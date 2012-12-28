class AddVacationsSinceUntilFields < ActiveRecord::Migration
  def change
    add_column :vacations, :since, :date
    add_column :vacations, :until, :date
  end
end

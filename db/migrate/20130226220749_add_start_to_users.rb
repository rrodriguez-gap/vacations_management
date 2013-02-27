class AddStartToUsers < ActiveRecord::Migration
  def change
    add_column :users, :start_working_on, :date
  end
end

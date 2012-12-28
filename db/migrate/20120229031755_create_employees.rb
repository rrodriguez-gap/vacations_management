class CreateEmployees < ActiveRecord::Migration
  def change
    create_table(:employees) do |t|
      t.string :first_name
	  t.string :last_name
	  t.string :identification
	  t.string :leader_name
	  t.date :start_working_on

      t.timestamps
    end
  end
end
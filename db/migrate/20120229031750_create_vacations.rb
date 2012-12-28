class CreateVacations < ActiveRecord::Migration
  def change
    create_table :vacations do |t|
      t.string :description
      t.integer :days
      t.date :requested_on
      t.text :details

      t.timestamps
    end
  end
end

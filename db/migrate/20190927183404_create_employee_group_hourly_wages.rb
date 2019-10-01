class CreateEmployeeGroupHourlyWages < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_group_hourly_wages do |t|
      t.references :employee_group
      t.decimal :hourly_wage, precision: 6, scale: 2
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end

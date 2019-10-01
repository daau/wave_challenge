class CreateEmployeeGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_groups do |t|
      t.string :name, index: true
      t.integer :hourly_wage
      t.timestamps
    end
  end
end

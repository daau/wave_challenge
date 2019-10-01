class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :long_id, index: true
      t.references :employee_group
      t.timestamps
    end
  end
end

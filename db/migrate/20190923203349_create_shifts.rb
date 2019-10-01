class CreateShifts < ActiveRecord::Migration[5.2]
  def change
    create_table :shifts do |t|
      t.references :employee
      t.references :shift_report
      t.references :pay_period
      t.date :date_worked, index: true
      t.decimal :hours_worked, precision: 3, scale: 1
      t.timestamps
    end
  end
end

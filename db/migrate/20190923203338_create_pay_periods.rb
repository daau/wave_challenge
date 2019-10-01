class CreatePayPeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :pay_periods do |t|
      t.references :employee
      t.date :start_date, index: true
      t.date :end_date, index: true
      t.timestamps
    end
  end
end

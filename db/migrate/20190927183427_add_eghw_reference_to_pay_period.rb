class AddEghwReferenceToPayPeriod < ActiveRecord::Migration[5.2]
  def change
    add_reference :pay_periods, :employee_group_hourly_wages
  end
end

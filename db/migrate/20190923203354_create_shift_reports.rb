class CreateShiftReports < ActiveRecord::Migration[5.2]
  def change
    create_table :shift_reports do |t|
      t.string :report_id, index: true
      t.timestamps
    end
  end
end

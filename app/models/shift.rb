class Shift < ApplicationRecord
  belongs_to :employee
  belongs_to :shift_report
  belongs_to :pay_period

  validates :date_worked, presence: true
  validates :hours_worked, presence: true  
end

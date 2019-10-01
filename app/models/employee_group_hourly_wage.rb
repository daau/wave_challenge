class EmployeeGroupHourlyWage < ApplicationRecord
  has_many :pay_periods, dependent: :nullify

  belongs_to :employee_group

  validates :start_date, presence: true
  validates :hourly_wage, presence: true
end

class EmployeeGroup < ApplicationRecord
  has_many :employees, dependent: :nullify
  has_many :employee_group_hourly_wages, dependent: :nullify

  validates :name, uniqueness: true, presence: true
  validates :hourly_wage, presence: true
end

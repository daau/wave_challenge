class Employee < ApplicationRecord
  belongs_to :employee_group

  has_many :pay_periods, dependent: :destroy
  has_many :shifts, dependent: :destroy

  validates :long_id, presence: true, uniqueness: true

  delegate :hourly_wage, to: :employee_group
end

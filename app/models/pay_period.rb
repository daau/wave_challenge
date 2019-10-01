class PayPeriod < ApplicationRecord
  belongs_to :employee
  belongs_to :employee_group_hourly_wage

  has_many :shifts, dependent: :destroy

  validates :start_date, presence: true
  validates :end_date, presence: true

  class << self
    def interval_for(date)
      if date.day <= 15
        [date.beginning_of_month, date.change(day: 15)]
      else
        [date.change(day: 16), date.end_of_month]
      end
    end
  end

  def total_earnings
    total_shift_hours * employee.hourly_wage
  end

  def total_shift_hours
    self.shifts.sum(:hours_worked)
  end

  def employee_long_id
    employee.long_id
  end  
end

# Virtual class that represents a work-shift
class Shiftable
  attr_reader :date, :hours_worked, :employee_id, :employee_group

  def initialize(date, hours_worked, employee_id, employee_group)
    @date = date
    @hours_worked = hours_worked.to_i
    @employee_id = employee_id
    @employee_group = employee_group
  end
end
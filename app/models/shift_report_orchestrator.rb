# Receive an uploaded shift report and create the necessary records
class ShiftReportOrchestrator

  def initialize(shift_report_file)
    get_reportable(shift_report_file)
  end

  def call
    @shift_report = ShiftReport.new(report_id: @reportable.report_id)
    return @shift_report unless @shift_report.valid?

    begin
      # Find or create the necessary PayPeriod, Employee, and Shift records,
      # as detailed within uploaded shift report
      ActiveRecord::Base.transaction do

        @reportable.shifts.each do |shiftable|
          shift_date = shiftable.date.to_date
          pay_period_start_date, pay_period_end_date = PayPeriod.interval_for(shift_date)

          employee_group  = EmployeeGroup.find_by(name: shiftable.employee_group)
          
          employee        = Employee.find_or_initialize_by(long_id: shiftable.employee_id,
                                                          employee_group: employee_group)

          pay_period      = employee.pay_periods.find_or_initialize_by(start_date: pay_period_start_date,
                                                                      end_date: pay_period_end_date)

          shift           = employee.shifts.new(employee: employee,
                                                pay_period: pay_period,
                                                shift_report: @shift_report,
                                                date_worked: shift_date,
                                                hours_worked: shiftable.hours_worked)

          employee.save!
          pay_period.save!
          shift.save!
        end

        @shift_report.save!
      end
    rescue ActiveRecord::RecordInvalid
      @shift_report.errors.add(:base, :invalid, message: "File is invalid")
    end
    
    @shift_report
  end

  private
    def get_reportable(file)
      # Parse the CSV file and create a Reportable object as an abstraction of it
      # We know the MIME type will be a csv, for now...
      @reportable = Reportable.from_csv(file)
    end
end
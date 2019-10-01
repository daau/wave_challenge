# Virtual class that represents a shift report
require 'csv'
class Reportable
  attr_reader :report_id, :shifts

  class << self
    DATE_IDX = 0
    HOURS_WORKED_IDX = 1
    EMPLOYEE_ID_IDX = 2
    JOB_GROUP_IDX = 3

    REPORT_ID_ROW = -1
    REPORT_ID_IDX = 1

    def from_csv(report)
      csv = CSV.parse(report.read, headers: true)

      report_id = csv[REPORT_ID_ROW][REPORT_ID_IDX]
      
      # Read all rows, except for the last row which is the footer
      shifts = csv[0..-2].map do |row|
        Shiftable.new(
          row[DATE_IDX],
          row[HOURS_WORKED_IDX],
          row[EMPLOYEE_ID_IDX],
          row[JOB_GROUP_IDX]
        )
      end

      self.new(report_id, shifts)

    end
  end

  def initialize(report_id, shifts)
    @report_id = report_id
    @shifts = shifts
  end
end
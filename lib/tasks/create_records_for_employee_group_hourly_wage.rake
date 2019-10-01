namespace :create_records_for_employee_group_hourly_wage do
  ActiveRecord::Base.transaction do
    puts "Creating EGHW"

    EmployeeGroup.all.each do |eg|
      eg.employee_group_hourly_wage.create(
        hourly_wage: eg.hourly_wage, 
        start_date: Time.now - 5.years
      )
    end

    PayPeriod.all.each do |p|
      p.employee_group_hourly_wage = p.employee.employee_group.employee_group_hourly_wage.first
    end

  end
end

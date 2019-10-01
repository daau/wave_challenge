class PayPeriodsController < ApplicationController
  def index
    @pay_periods = PayPeriod.all.order(:employee_id, :start_date)
  end
end
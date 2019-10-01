class ShiftReportsController < ApplicationController
  rescue_from ActionController::ParameterMissing, with: :show_errors

  def create
    shift_report_file = params.require(:report_file)

    @shift_report = ShiftReportOrchestrator.new(shift_report_file).call

    if @shift_report.persisted?
      flash[:notice] = "Shift report successfully uploaded"
      redirect_to root_path
    else
      flash[:error] = @shift_report.errors.full_messages.to_sentence
      redirect_to root_path
    end
  end

  private

    def show_errors
      flash[:error] = "Please upload a file!"
      redirect_to root_path
    end
end
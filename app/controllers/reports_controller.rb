class ReportsController < ApplicationController
	def index
		
	end

	def new
		@report = Report.new
	end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
   if @report.save
      redirect_to reports_path, notice: t("action_messages.create", model: "Report")
    else
      render :new
    end
  end

  private

    # Only allow a trusted parameter "white list" through.
    def report_params
      params.require(:report).permit(:title, :start_date, :end_date, :service_type, :target_type, {service_ids: []}, {target_ids: []})
    end
end
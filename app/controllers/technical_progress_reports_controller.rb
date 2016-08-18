class TechnicalProgressReportsController < ApplicationController
  before_action :set_technical_progress_report, only: [:show]

  def index
    @technical_progress_reports = TechnicalProgressReport.all
  end

  def show
  end

  private

  def set_technical_progress_report
    @technical_progress_report = TechnicalProgressReport.find(params[:id])
  end

end

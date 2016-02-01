class TargetsController < ApplicationController
	def new
		@target = Target.new
  end
	
	private
		def set_project
      @project = Project.find(params[:project_id])
    end
	
		def set_indicator
			@indicator = Indicator.find(params[:indicator_id])
		end
end

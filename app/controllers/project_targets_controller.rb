class ProjectTargetsController < ApplicationController
  before_action :set_project

  def create
    @project_target = ProjectTarget.new(project_target_params)
    @project_target.project_id = @project.id

    respond_to do |format|
      if @project_target.save
        format.html {
          redirect_to :back, notice: t("action_messages.create",
                                       model: ProjectTarget.model_name.human)
        }
        format.js
      else
        format.html {
          redirect_to :back, alert: t("action_messages.create_failed",
                                      model: ProjectTarget.model_name.human,
                                      error: alert)
        }
        format.js
      end
    end
  end

  private

  def set_project
    @project = Project.first
  end

  def project_target_params
    params.require(:project_target).permit(
      :id, :project_target_type_id, :project_id, :target
    )
  end
end

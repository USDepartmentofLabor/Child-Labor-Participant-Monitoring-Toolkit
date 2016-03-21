class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index]

  def index
    if current_user
      redirect_to project_path
      return
    end
    render layout: "front"
  end

  def dashboard
    @projects = Project.where("user_id = ?", current_user.id)

    if @projects.length == 0
      # go to new project page
      redirect_to new_project_path
    elsif @projects.length == 1
      # go to project
      redirect_to project_path(@projects[0])
    else
      render layout: "front"
    end
  end
end

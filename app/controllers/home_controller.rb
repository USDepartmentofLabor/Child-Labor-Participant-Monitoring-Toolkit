class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index]

  def index
    if current_user
      redirect_to dashboard_path
      return
    end
    render layout: "front"
  end

  def dashboard
		@projects = Project.where("user_id = ?", current_user.id)
  end
end
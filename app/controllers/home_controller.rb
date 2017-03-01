class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index]

  def index
    if current_user
      redirect_to project_path
      return
    end
    render layout: "login"
  end
end

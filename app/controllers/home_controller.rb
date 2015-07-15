class HomeController < ApplicationController
  skip_before_filter :authenticate_user!, :only => [:index]

  def index
    render layout: "front"
  end

  def dashboard
    @projects = Project.all
    @project = Project.new
  end
end
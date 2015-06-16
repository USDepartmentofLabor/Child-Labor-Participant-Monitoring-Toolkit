class HomeController < ApplicationController
	# skip_before_filter :authenticate_user!, :only => [:index]

	def index
		@projects = Project.all
    @project = Project.new
	end
end
class ChildrenController < ApplicationController
  before_action :set_project
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  # GET /children
  def index
    @children = Child.order(:id).page(params[:page])
  end

  # GET /children/1
  def show
    @child_statuses = @child.statuses.includes(:work_status, :education_status)
  end

  # GET /children/new
  def new
    @child = Child.new
  end

  # GET /children/1/edit
  def edit
  end

  # POST /children
  def create
    @child = Child.new(child_params)

    if @child.save
      redirect_to @child, notice: t("action_messages.create", model: "Child")
    else
      render :new
    end
  end

  # PATCH/PUT /children/1
  def update
    if @child.update(child_params)
      redirect_to @child, notice: t("action_messages.update", model: "Child")
    else
      render :edit
    end
  end

  # DELETE /children/1
  def destroy
    @child.destroy
    redirect_to children_url, notice: t("action_messages.destroy", model: "Child")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Only allow a trusted parameter "white list" through.
    def child_params
      params.require(:child).permit(:fname, :lname, :mname, :sex, :dob, :address, :city, :state, :country)
    end
end

class ChildrenController < ApplicationController
  before_action :do_authorize
  before_action :set_project
  before_action :set_child, only: [:show, :edit, :update, :destroy]
  before_action :set_regions, only: [:new, :create, :show, :edit, :update]

  # GET /children
  def index
    @children = Child.all
  end

  # GET /children/1
  def show
    @child_statuses = @child.statuses.includes(:work_status, :education_status)
    @service_instances = @child.service_instances.includes(:service)
    @custom_fields = CustomField.where(model_type: "Child").with_values(@child.id)
    @custom_status_fields = CustomField.where(model_type: "ChildFollowup").with_values(@child.id)
  end

  # GET /children/new
  def new
    @child = Child.new
    @child.statuses << ChildStatus.new(user_id: current_user.id)
    @section_1_custom_fields = CustomSection
      .where('model_type = ? AND sort_order = ?', 'Child', 1).first.custom_fields
    @sections = CustomSection.where('model_type = ? AND sort_order > ?', 'Child', 1)
  end

  # GET /children/1/edit
  def edit
    @custom_fields = CustomField.where(model_type: "Child").with_values(@child.id)
  end

  # POST /children
  def create
    @child = Child.new(child_params)
    @custom_fields = CustomField.where(model_type: "Child")

    if @child.save
      if params[:custom_fields].present? && @custom_fields.length > 0
        CustomFieldGroup.create_or_update(@child, @custom_fields, params_for_custom_field)
      end

      redirect_to new_child_path, notice: t("action_messages.create", model: Child.model_name.human)
    else
      render :new
    end
  end

  # PATCH/PUT /children/1
  def update
    @custom_fields = CustomField.where(model_type: "Child")
    if @child.update(child_params)
      if params[:custom_fields].present? && @custom_fields.length > 0
        CustomFieldGroup.create_or_update(@child, @custom_fields, params_for_custom_field)
      end
      redirect_to child_path(@child), notice: t("action_messages.update", model: Child.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @child.destroy
    redirect_to children_path, notice: t("action_messages.destroy", model: Child.model_name.human)
  end

  private
    def do_authorize
      #authorize Child
    end

    def set_project
      @project = Project.first
    end

    def set_regions
      @regions = Region.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def child_params
      params.require(:child).permit(
        :first_name, :last_name, :middle_name, :sex, :dob, :age, :household_id,
        :intake_date,
        statuses_attributes: [
          :start_date, :end_date, :work_status_id, :education_status_id,
          :note, :user_id, :_destroy, :id
        ]
      )
    end

    def params_for_custom_field
      params.require(:custom_fields)
    end
end

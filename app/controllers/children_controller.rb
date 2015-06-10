class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :edit, :update, :destroy]

  # GET /children
  def index
    @children = Child.order(:id).page(params[:page])
  end

  # GET /children/1
  def show
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
      redirect_to @child, notice: 'Child was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /children/1
  def update
    if @child.update(child_params)
      redirect_to @child, notice: 'Child was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /children/1
  def destroy
    @child.destroy
    redirect_to children_url, notice: 'Child was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def child_params
      params.require(:child).permit(:fname, :lname, :mname, :sex, :dob, :address, :city, :state, :country)
    end
end

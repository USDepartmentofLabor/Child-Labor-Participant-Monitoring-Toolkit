class RelationshipsController < ApplicationController
  before_action :set_relationship, only: [:edit, :update, :destroy]

  def index
    @relationships = Relationship.order(:code).all
  end

  def new
    @relationship = Relationship.new
  end

  def create
    @relationship = Relationship.new(relationship_params)

    @relationship.canonical_name = 'C_' + @relationship.display_name.parameterize('_').upcase

    if @relationship.save
      redirect_to relationships_path,
        notice: t("action_messages.create",
                  model: Relationship.model_name.human)
    else
      render :new
    end
  end

  def update
    if @relationship.update(relationship_params)
      redirect_to relationships_path,
        notice: t("action_messages.update",
                  model: Relationship.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @relationship.destroy
    redirect_to relationships_path,
      notice: t("action_messages.destroy",
                model: Relationship.model_name.human)
  end

  private

  def set_relationship
    @relationship = Relationship.find(params[:id])
  end

  def relationship_params
    params.require(:relationship).permit(:code, :display_name)
  end
end

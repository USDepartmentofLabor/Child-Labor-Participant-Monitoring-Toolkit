class Api::V1::RelationshipsController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/v1/relationships  
  def index
    render json: Relationship.all.to_json
  end

  # GET /api/v1/relationships/1
  def show
    @relationship = Relationship.find(params[:id])
    render json: @relationship
  end
  
end
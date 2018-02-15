class Api::V1::RelationshipsController < Api::ApiController
  before_filter :ensure_user_allowed

  # GET /api/relationships
  def index
    render json: Relationship.all.to_json
  end

  # GET /api/relationships/1
  def show
    if Relationship.exists?(params[:id])
      @relationship = Relationship.find(params[:id])
      render json: @relationship.to_json
    else
      render status: 404, json: '{"status":"failure"}'
    end

  end

end

class Api::V1::CommentsController < Api::ApiController
  before_filter :ensure_allowed
  
  def create
    comment = Comment.new(comment_params)
    if comment.save!
      render json: {status: 'submitted'}
    else
      render json: {status: 'failed'}
    end
  end

  private

  def comment_params
    params[:comment].permit(
      :id, :parent_id, :parent_type, :body, :author, :submitted_at
    )
  end
end
